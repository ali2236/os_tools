import 'package:abstarct_date/abstarct_date.dart';
import 'package:build/build.dart';
import 'package:mustache/mustache.dart';
import 'package:path/path.dart' as path;
import 'package:static_aligator_ir/builders.dart';
import 'package:static_aligator_ir/src/importers/importers.dart';
import 'package:yaml/yaml.dart';

///
/// This class is primarily used by [MarkdownBuilder] for easier processing
///
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
        partials = List<String>.from(config['partials'] ?? []),
        assert(config['template'] != null, 'template must not be null');

  Future<Map<String, dynamic>> getConfigs() async {
    final configData = <String, dynamic>{
      'title': title,
      'tags': tags,
      'data': data,
      'date': Date<GregorianDate>.now()
          .formatBuilder((d) => '${d.DDDD}, ${d.MMMM} ${d.dd}, ${d.yyyy}'),
    };

    ///
    /// For each [import] path, import the data into [configData]
    /// using the appropriate importer
    ///
    await Future.forEach(imports, (importPath) async {
      log.fine('importing ${importPath}');

      ///
      ///  remove the dot from index 0
      ///
      final extension = path.extension(importPath).substring(1);

      ///
      /// having the file name can be useful
      ///
      final name = path.basenameWithoutExtension(importPath);

      ///
      /// get the asset for import
      ///
      final importAsset = _getAsset(importPath);

      ///
      /// read the asset file
      ///
      final source = await buildStep.readAsString(importAsset);

      ///
      /// config
      ///
      final entry = name;

      /// Importing
      final importer = importers.getImporter(extension);
      log.fine('importing using $extension');
      final read = importer.import(source, const {});
      log.fine('import done');
      //////////////////////////////

      configData.addAll({entry: read});
    });

    ///
    /// for each [partial] path, load the partial
    ///
    configData.addAll({'partialResolver': <String, Template>{}});
    await Future.forEach<String>(partials, (partial) async {
      ///
      /// get the name of the partial file
      ///
      final name = path.basenameWithoutExtension(partial);

      ///
      /// The contents of the partial file
      ///
      final source = await buildStep.readAsString(_getAsset(partial));

      ///
      /// The Template from [source]
      ///
      final template = Template(
        source,
        partialResolver: (name) => configData['partialResolver'][name],
      );

      ///
      /// partialResolver is a Map<String name, Template template>
      ///
      configData['partialResolver'][name] = template;
    });

    ///
    /// ConfigData should contain all the required data resolved from the md
    /// file header
    ///
    return configData;
  }

  ///
  /// Returns The Contents of the layout file as specified in the md header
  ///
  Future<String> readTemplateSource() async {
    return await buildStep.readAsString(_getAsset(_template));
  }

  AssetId _getAsset(String filePath) {
    ///
    /// abbreviation
    ///
    final package = buildStep.inputId.package;

    ///
    /// if the partial starts with ./ it is considered relative from input file
    ///
    /// relative example:
    ///   ./data.json
    ///
    /// absolute from web/:
    ///   data/data.json
    ///
    final relative = filePath.startsWith(r'./');

    ///
    /// All Files are relative from the /web folder
    ///
    if (relative) {
      filePath = path.join(path.dirname(buildStep.inputId.path), filePath);
    } else {
      filePath = path.join('web', filePath);
    }

    ///
    /// The asset representing [filePath]
    ///
    final asset = AssetId(package, filePath);

    return asset;
  }
}
