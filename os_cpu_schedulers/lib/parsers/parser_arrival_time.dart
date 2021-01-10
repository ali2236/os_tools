import 'package:os_cpu_schedulers/models/Process.dart';
import 'package:os_cpu_schedulers/models/ProcessParser.dart';

class ArrivalTimeParser implements ProcessParser{
  @override
  List<Process> parse(String rawInput) {
    var row = rawInput.split('\n');
    return row.map((s) => Process.fromString(s)).toList();
  }

  @override
  String get template => '<Process Name> <Service Time> <Arrival Time = 0> \\n';

}