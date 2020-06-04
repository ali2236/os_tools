import 'dart:io';

import 'package:build/build.dart';
import 'package:static_aligator_ir/src/importers/importers.dart';
import 'package:yaml/yaml.dart';

class PageConfig {
  final String title;
  final String tags;
  final String url;
  final String _template;
  final List imports;
  final List<String> transformers;
  final data;

  PageConfig(YamlMap config)
      : title = config['title'] ?? 'Aligator',
        tags = config['tags'] ?? 'no tag',
        imports = config['imports'] ?? [],
        url = config['url'],
        _template = config['template'],
        data = config['data'],
        transformers =
            List<String>.from(config['transformers']  ?? ['markdown']);

  AssetId getTemplate(String package) => AssetId(package, _template);

  Future<Map<String, dynamic>> getConfigs() async {
    final configData = <String, dynamic>{
      'title': title,
      'tags': tags,
      'data': data,
    };

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

      final importer = importers.getImporter(importerId);
      log.fine('importing using $importerId');
      final read = importer.import(content, Map<String, dynamic>.from(config));
      log.fine('import done');
      configData.addAll({entry: read});
    });

    return configData;
  }
}
