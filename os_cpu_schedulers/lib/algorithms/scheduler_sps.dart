import 'package:os_cpu_schedulers/algorithms/scheduler_fcfs.dart';
import 'package:os_cpu_schedulers/models/Process.dart';
import 'package:os_cpu_schedulers/models/TimeWindow.dart';

class StaticPriorityScheduling extends FirstComeFirstServed {

  @override
  List<TimeWindow> calculate(List<Process> processes) {
    processes.sort((p1,p2)=>p1.priority.compareTo(p2.priority));
    return super.calculate(processes);
  }

}