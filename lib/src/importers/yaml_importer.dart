import 'package:yaml/yaml.dart';

import 'importers.dart';

class YamlImporter extends Importer {
  @override
  dynamic import(String source, Map config) {
    final parsed = loadYaml(source);
    if (parsed is YamlMap) {
      return Map<String, dynamic>.from(parsed);
    } else if(parsed is YamlList){
      return List.from(parsed);
    } else {
      return parsed;
    }
  }
}
