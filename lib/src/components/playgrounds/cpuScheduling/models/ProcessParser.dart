import 'Process.dart';

abstract class ProcessParser {
  String get template;
  List<Process> parse(String rawInput);
}

class ArrivalTimeParser implements ProcessParser{
  @override
  List<Process> parse(String rawInput) {
    var row = rawInput.split('\n');
    return row.map((s) => Process.fromString(s)).toList();
  }

  @override
  String get template => '<Process Name> <Service Time> <Arrival Time = 0> \\n';

}

class PriorityProcessParser implements ProcessParser {
  @override
  List<Process> parse(String rawInput) {
    var row = rawInput.split('\n');
    return row.map((s) => Process.fromStringWithPriority(s)).toList();
  }

  @override
  String get template => '<Process Name> <Service Time> <Priority> <Arrival Time = 0>\\n';

}