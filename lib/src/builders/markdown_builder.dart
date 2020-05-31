import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:build/build.dart';
import 'package:markdown/markdown.dart';
import 'package:mustache/mustache.dart';
import 'package:static_aligator_ir/plugin_registry.dart';
import 'package:static_aligator_ir/src/page_config.dart';
import 'package:static_aligator_ir/src/template_loader.dart';
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
    final loader = TemplateLoader();
    await loader.loadTemplates(Directory('web/templates'));

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

    final template = AssetId(buildStep.inputId.package,
        'web/templates/' + config['template'] ?? 'index.mustache');
    final templateContent = await buildStep.readAsString(template);
    final markdown = contents.substring(configEnd+3);
    final renderedMustache =
        Template(markdown, partialResolver: loader.getTemplate)
            .renderString(configData);
    final markdownHtml = markdownToHtml(renderedMustache);
    final plugins = List<String>.unmodifiable(config['plugins'] ?? []);
    final processedHtml = pluginRegistry.applyAll(markdownHtml, plugins);

    final data = {
      'content': processedHtml,
      'hash': DateTime.now().millisecondsSinceEpoch.toRadixString(32),
      ...configData,
    };

    final mustacheTemplate =
        Template(templateContent, partialResolver: loader.getTemplate);
    final processedTemplate = mustacheTemplate.renderString(data);
    await buildStep.writeAsString(output, processedTemplate);

    log.fine('transformed md to html: ${output.path}');
  }
}
