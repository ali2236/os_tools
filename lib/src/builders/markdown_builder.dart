import 'dart:async';
import 'dart:developer';

import 'package:build/build.dart';
import 'package:static_aligator_ir/src/transformers/transformers.dart';
import 'package:static_aligator_ir/src/page_config.dart';
import 'package:yaml/yaml.dart';
import 'package:path/path.dart' as path;

Builder markdownBuilder(options) => MarkdownBuilder();

class MarkdownBuilder implements Builder {

  static final Map<String, String> urls = {};

  @override
  Map<String, List<String>> get buildExtensions => {
        '.md': ['.html'],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    var input = buildStep.inputId;
    var output = input.changeExtension('.html');

    var contents = await buildStep.readAsString(input);

    final configStart = contents.indexOf('---');
    final configEnd = contents.indexOf('---', configStart + 3);

    final configString = contents.substring(configStart + 3, configEnd);
    final config = loadYaml(configString) as YamlMap;
    final pageConfig = PageConfig(config);
    final configData = await pageConfig.getConfigs();
    
    if(pageConfig.url != null){
      urls[output.path] = 'web${path.withoutExtension(pageConfig.url)}.html';
    }

    final template = pageConfig.getTemplate(input.package);
    final templateContent = await buildStep.readAsString(template);
    final source = contents.substring(configEnd+3);
    final content = transformer.applyAll(source, ['mustache','markdown'], configData);

    final data = {
      'content': content,
      'hash': DateTime.now().millisecondsSinceEpoch.toRadixString(32),
      ...configData,
    };

    final processedTemplate = transformer.apply(templateContent, 'mustache', data);
    await buildStep.writeAsString(output, processedTemplate);

    log.fine('transformed md to html: ${output.path}');
  }
}
