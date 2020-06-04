import 'dart:async';

import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:mustache/mustache.dart';
import 'package:path/path.dart' as path;

Builder templateBuilder(_) => TemplateBuilder();

class TemplateBuilder extends Builder {
  static Map<String, Template> templates = {};

  static Template getTemplate(String name) => templates[name];

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final source = await buildStep.readAsString(buildStep.inputId);
    final template = Template(source, partialResolver: getTemplate);
    final name = path.basenameWithoutExtension(buildStep.inputId.path);
    templates.addAll({name: template});
    log.fine('added $name');

    await buildStep.writeAsString(
        buildStep.inputId.changeExtension('.mustacheslug'), '$name added');
  }

  Glob get mustacheFiles => Glob('web/**.mustache');

  @override
  final Map<String, List<String>> buildExtensions = {
    r'.mustache': ['.mustacheslug'],
  };
}
