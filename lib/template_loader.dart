import 'dart:io';

import 'package:mustache/mustache.dart';

class TemplateLoader {
  final Map<String, Template> _templates = {};

  bool loaded = false;

  Future<void> loadTemplates(Directory directory) async {
    loaded = true;
    return directory.list().forEach((file) async {
      final fullName = file.uri.pathSegments.last;
      final name = fullName.substring(0, fullName.lastIndexOf('.'));
      final content = await File.fromUri(file.uri).readAsString();
      final template = Template(content, partialResolver: getTemplate);
      _templates.addAll({name: template});
    });
  }

  Template getTemplate(String name) => _templates[name];
}
