import 'dart:async';
import 'dart:io';

import 'package:build/build.dart';
import 'package:markdown/markdown.dart';
import 'package:mustache/mustache.dart';
import 'package:static_aligator_ir/template_loader.dart';
import 'package:yaml/yaml.dart';

Builder markdownBuilder(options) => MarkdownBuilder();

class MarkdownBuilder implements Builder {
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

    final template = AssetId(buildStep.inputId.package, 'web/templates/' + config['template'] ?? 'index.mustache');
    final templateContent = await buildStep.readAsString(template);
    final markdown = contents.substring(configEnd + 3);
    final renderedMustache = Template(markdown,  partialResolver: loader.getTemplate).renderString(config);
    final markdownHtml = markdownToHtml(renderedMustache);
    final data = {
      'content': markdownHtml,
      ...config,
    };

    final mustacheTemplate =
        Template(templateContent, partialResolver: loader.getTemplate);
    final processedTemplate = mustacheTemplate.renderString(data);
    await buildStep.writeAsString(output, processedTemplate);


  }
}
