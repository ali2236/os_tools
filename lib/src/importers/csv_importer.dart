import 'package:build/build.dart';
import 'package:csv/csv.dart';

import 'importers.dart';

class CsvImporter extends Importer {
  @override
  dynamic import(String source, Map config) {
    try {
      final converter = CsvToListConverter();
      var rows = converter.convert(source);
      final schema = rows.first;
      log.fine("schema: " + schema.toString());
      rows = rows.skip(1).toList();
      final data = rows.map<Map<String, dynamic>>(mapList(schema)).toList();
      return data;
    } catch(e){
      log.severe('Exception: $e');
    }
  }

  Map<String, dynamic> Function(List list) mapList(List schema) {
    return (List list) {
      var values = list.map<String>((v) => v.toString()).toList();
      try {
        return {
          for (var i = 0; i < schema.length; i++) schema[i]: values[i],
          'valid' : true,
        };
      } catch (e){
        return {
          'valid' : false,
        };
      }
    };
  }
}