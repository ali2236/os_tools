import 'package:static_aligator_ir/src/importers/yaml_importer.dart';

import 'csv_importer.dart';

final importers = ImporterRegistry({
  'csv': CsvImporter(),
  'yaml':YamlImporter(),
});

class ImporterRegistry {
  final Map<String, Importer> _importers;

  ImporterRegistry(this._importers);

  Importer getImporter(String id) {
    return _importers[id];
  }
}

abstract class Importer {
  dynamic import(String source, Map config);
}


