
import 'package:os_cpu_schedulers/models/Process.dart';
import 'package:os_cpu_schedulers/models/TimeWindow.dart';

import 'scheduler_fcfs.dart';

class ShortestJobFirst extends FirstComeFirstServed {

  @override
  List<TimeWindow> calculate(List<Process> processes) {
    processes.sort((p1,p2)=>p1.serviceTime.compareTo(p2.serviceTime));
    return super.calculate(processes);
  }

}