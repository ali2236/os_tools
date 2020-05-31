import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:static_aligator_ir/builders.dart';
import 'package:xml/xml.dart';

Builder sitemapBuilder(options) => SitemapBuilder('www.aligator.ir');

class SitemapBuilder implements Builder {
  final String host;

  SitemapBuilder(this.host);

/*  @override
  Iterable<String> get inputExtensions => [r'$package$'];*/

  @override
  Map<String, List<String>> get buildExtensions => {
        r'$package$': ['web/sitemap.xml']
      };

  @override
  FutureOr<Null> build(BuildStep buildStep) async {
    final inputs = Glob('web/**.html');
    var counter = 0;
    var urls = <String>[];
    await for (var asset in buildStep.findAssets(inputs)) {
      final webIndex = asset.uri.pathSegments.indexOf('web');
      final url = Uri(
          scheme: 'http',
          host: host,
          pathSegments: asset.uri.pathSegments.sublist(webIndex + 1));
      urls.add(url.toString());
      counter++;
    }

    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0" encoding="UTF-8"');
    builder.element('urlset', attributes: const {
      'xmlns': 'http://www.sitemaps.org/schemas/sitemap/0.9'
    }, nest: () {
      for (var url in urls) {
        builder.element('url', nest: () {
          builder.element('loc', nest: () {
            builder.text(url);
          });
        });
      }
    });

    final output = AssetId(buildStep.inputId.package, 'web/sitemap.xml');
    await buildStep.writeAsString(
        output, builder.build().toXmlString(pretty: true));
    log.info('built sitemap with $counter entries.');
  }
}
