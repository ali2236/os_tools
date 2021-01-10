import 'Process.dart';

abstract class ProcessParser {
  String get template;
  List<Process> parse(String rawInput);
}