import 'dart:convert';

import 'importers.dart';

class JsonImporter extends Importer {
  @override
  dynamic import(String source, Map config) {
    return jsonDecode(source);
  }

}