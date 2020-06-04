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
  final BuildStep buildStep;

  PageConfig(this.buildStep, YamlMap config)
      : title = config['title'] ?? 'Aligator',
        tags = config['tags'] ?? 'no tag',
        imports = List<String>.from(config['imports'] ?? []),
        url = config['url'],
        _template = config['template'],
        data = config['data'],
        transformers =
        List<String>.from(config['transformers'] ?? ['markdown']),
        partials = List<String>.from(config['partials'] ?? []);

  AssetId _getAsset(String pathFromWeb) =>
      AssetId(buildStep.inputId.package, path.join('web', pathFromWeb));

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
      final source = await buildStep.readAsString(_getAsset(import));

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
    configData.addAll({'partialResolver': <String, Template>{}});
    await Future.forEach(partials, (partial) async {
      final source = await buildStep.readAsString(_getAsset(partial));
      final name = path.basenameWithoutExtension(partial);
      final template = Template(source,
          partialResolver: (name) => configData['partialResolver'][name]);
      configData['partialResolver'][name] = template;
    });

    return configData;
  }

  Future<String> readTemplateSource() async{
    return await buildStep.readAsString(_getAsset(_template));
  }
}
