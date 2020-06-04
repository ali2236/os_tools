import 'package:build/build.dart';
import 'package:csv/csv.dart';

import 'importers.dart';

class CsvImporter extends Importer {
  @override
  dynamic import(String source, Map config) {
    try {
      final converter = CsvToListConverter();
      final schema = (config['schema'] as String).split(',').map((s) =>
          s.trim()).toList();
      final rows = converter.convert(source);
      return rows.map<Map<String, dynamic>>(mapList(schema)).toList();
    } catch(e){
      log.severe('Exception: $e');
    }
  }

  Map<String, dynamic> Function(List list) mapList(List schema) {
    return (List list) {
      var values = list.map<String>((v) => v.toString()).toList();
      /*
      for(var i=schema.length-values.length;i!=0;i--) {
        values.add('');
      }*/
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