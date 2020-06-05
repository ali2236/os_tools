import 'package:static_aligator_ir/src/importers/importers.dart';

///
/// The class will greatly help when dealing with files that have config headers
///
///   general file structure:
///
///     ---
///     [config]
///     ---
///     [contents]
///
class FileSource {
  final String source;
  final String separator;

  FileSource(this.source, {this.separator = '---'});

  int _configStart, _configEnd;

  ///
  /// returns true if the file doesn't seem to have a header
  ///
  bool get hasHeader => (configStart - separator.length) != -1;

  ///
  /// returns the index after the separator
  ///
  int get configStart =>
      _configStart ??= source.indexOf(separator) + separator.length;

  ///
  /// returns the index of the first character of the separator
  ///
  int get configEnd => _configEnd ??= source.indexOf(separator, configStart);

  ///
  /// returns the config that is specified between the separator
  ///
  ///   example:
  ///     - index.md:
  ///     ---
  ///     title: hello world
  ///     layout: index.mustache
  ///     imports:
  ///       - data.json
  ///     ---
  ///     File Contents
  ///
  Map<String, dynamic> getConfig({String importer = 'yaml', Map config}) {
    if (hasHeader) {
      final configString = source.substring(configStart, configEnd);
      return importers.getImporter(importer).import(configString, config ?? {});
    } else {
      return const {};
    }
  }

  ///
  /// The contents of the file, starting from after the [configEnd] separator
  ///
  String getContents() {
    if (hasHeader) {
      return source.substring(configEnd + separator.length);
    } else {
      return source;
    }
  }
}
