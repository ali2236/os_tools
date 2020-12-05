import 'package:static_aligator_ir/src/components/playgrounds/OS/models/Process.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/models/Scheduler.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/models/TimeWindow.dart';

import 'fcfs.dart';

class StaticPriorityScheduling implements CpuScheduler {

  @override
  List<TimeWindow> calculate(List<Process> processes) {
    processes.sort((p1,p2)=>p1.priority.compareTo(p2.priority));
    return FirstComeFirstServed().calculate(processes);
  }

}