import 'dart:io';

import 'package:static_aligator_ir/src/data_reader.dart';
import 'package:yaml/yaml.dart';

class PageConfig {
  final String title;
  final String tags;
  final List imports;

  PageConfig(YamlMap config)
      : title = config['title'] ?? 'Aligator',
        tags = config['tags'] ?? 'no tag',
        imports = config['imports'] ?? [];

  Future<Map<String, dynamic>> getConfigs() async {
    final configData = <String, dynamic>{
      'title': title,
      'tags': tags,
    };

    await Future.forEach(imports, (import) async {
      final file = File(import);
      final source = await file.readAsString();

      final configStart = source.indexOf('---');
      final configEnd = source.indexOf('---', configStart + 3);

      final configString = source.substring(configStart + 3, configEnd);
      final config = loadYaml(configString) as YamlMap;
      final readerId = config['reader'];
      final entry = config['entry'] as String;

      final content = source.substring(configEnd + 3);

      final reader = readers.getReader(readerId);
      final read = reader.read(content, config);

      configData.addAll({entry: read});
    });

    return configData;
  }
}
