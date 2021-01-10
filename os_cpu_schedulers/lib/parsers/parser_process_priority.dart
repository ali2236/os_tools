import 'package:os_cpu_schedulers/models/Process.dart';
import 'package:os_cpu_schedulers/models/ProcessParser.dart';

class PriorityProcessParser implements ProcessParser {
  @override
  List<Process> parse(String rawInput) {
    var row = rawInput.split('\n');
    return row.map((s) => Process.fromStringWithPriority(s)).toList();
  }

  @override
  String get template => '<Process Name> <Service Time> <Priority> <Arrival Time = 0>\\n';

}