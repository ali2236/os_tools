import 'dart:io';

import 'package:build/build.dart';
import 'package:mustache/mustache.dart';
import 'package:path/path.dart' as path;
import 'package:static_aligator_ir/src/importers/importers.dart';
import 'package:yaml/yaml.dart';

class PageConfig {
  final String title;
  final String tags;
  final String url;
  final String _template;
  final List<String> imports;
  final List<String> transformers;
  final List<String> partials;
  final data;

  PageConfig(YamlMap config)
      : title = config['title'] ?? 'Aligator',
        tags = config['tags'] ?? 'no tag',
        imports = List<String>.from(config['imports'] ?? []),
        url = config['url'],
        _template = config['template'],
        data = config['data'],
        transformers =
            List<String>.from(config['transformers'] ?? ['markdown']),
        partials = List<String>.from(config['partials'] ?? []);

  AssetId getTemplate(String package) => AssetId(package, _template);

  Future<Map<String, dynamic>> getConfigs() async {
    final configData = <String, dynamic>{
      'title': title,
      'tags': tags,
      'data': data,
    };

    ///
    /// For each [import]
    ///
    await Future.forEach(imports, (import) async {
      final file = File(import);
      final source = await file.readAsString();

      final configStart = source.indexOf('---');
      final configEnd = source.indexOf('---', configStart + 3);

      final configString = source.substring(configStart + 3, configEnd);
      final config = loadYaml(configString) as YamlMap;
      final importerId = config['importer'];
      final entry = config['entry'] as String;
      final content = source.substring(configEnd + 3);

      /// Importing
      final importer = importers.getImporter(importerId);
      log.fine('importing using $importerId');
      final read = importer.import(content, Map<String, dynamic>.from(config));
      log.fine('import done');
      //////////////////////////////

      configData.addAll({entry: read});
    });

    ///
    /// for each [partial]
    ///
    configData.addAll({'partialResolver' : <String, Template>{}});
    await Future.forEach(partials, (partial) async{
      final file = File(partial);
      final source = await file.readAsString();
      final name = path.basenameWithoutExtension(partial);
      final template = Template(source, partialResolver: (name) => configData['partialResolver'][name]);
      configData['partialResolver'][name] = template;
    });

    return configData;
  }
}
