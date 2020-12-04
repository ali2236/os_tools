import 'dart:collection';

import 'package:static_aligator_ir/src/components/playgrounds/OS/models/Process.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/models/Scheduler.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/models/TimeWindow.dart';

class HighestResponseRatioNext implements CpuScheduler {
  @override
  List<TimeWindow> calculate(List<Process> processes) {
    var time = 0;
    var doneProcesses = 0;
    var waitingQueue = Queue.of(processes);
    var readyList = <Process>[];
    var timeWindows = <TimeWindow>[];

    var ratio = (Process p) => (time - p.arrivalTime) / p.serviceTime;

    // for each time increment
    while (doneProcesses != processes.length) {
      // add ready processes
      var ready = waitingQueue.where((p) => p.arrivalTime <= time);
      ready.forEach(readyList.add);
      waitingQueue.removeWhere((p) => p.arrivalTime <= time);

      if (readyList.isNotEmpty) {
        readyList.sort((a, b) => ratio(a).compareTo(ratio(b)));
        var process = readyList.removeLast();
        var frame = process.runNonPreemptive(time);
        timeWindows.add(frame);
        doneProcesses++;
        time = frame.end;
      } else {
        time++;
      }
    }
    return timeWindows;
  }
}
