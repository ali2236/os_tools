import 'package:csv/csv.dart';
import 'package:yaml/yaml.dart';

final readers = Readers({
  'csv': CsvReader(),
});

class Readers {
  final Map<String, DataReader> _readers;

  Readers(this._readers);

  DataReader getReader(String id) {
    return _readers[id];
  }
}

abstract class DataReader {
  dynamic read(String source, Map config);
}

class CsvReader extends DataReader {
  @override
  dynamic read(String source, Map config) {
    final converter = CsvToListConverter();
    final schema = (config['schema'] as String).split(',').map((s) => s.trim()).toList();
    final rows = converter.convert(source);
    return rows.map<Map<String, dynamic>>(mapList(schema)).toList();
  }

  Map<String, dynamic> Function(List list) mapList(List schema) {
    return (List list) {
      var values = list.map<String>((v) => v.toString()).toList();
        for(var i=schema.length-values.length;i!=0;i--) {
          values.add('');
        }
      return {
        for (var i = 0; i < schema.length; i++) schema[i]: values[i],
      };
    };
  }
}
