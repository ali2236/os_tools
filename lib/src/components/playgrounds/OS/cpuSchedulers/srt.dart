import 'dart:collection';

import 'package:static_aligator_ir/src/components/playgrounds/OS/models/Process.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/models/Scheduler.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/models/TimeWindow.dart';

class ShortestRemainingTime implements CpuScheduler {
  @override
  List<TimeWindow> calculate(List<Process> processes) {
    var time = 0;
    var doneProcesses = 0;
    var waitingQueue = Queue.of(processes);
    var readyList = <Process>[];
    var timeWindows = <TimeWindow>[];
    Process lastProcess;

    // for each time increment
    while (doneProcesses != processes.length) {
      // add ready processes
      var ready = waitingQueue.where((p) => p.arrivalTime <= time);
      ready.forEach(readyList.add);
      waitingQueue.removeWhere((p) => p.arrivalTime <= time);

      if (readyList.isNotEmpty) {
        readyList.sort((a, b) => a.remainingTime.compareTo(b.remainingTime));
        var process = readyList.first;

        if (process != lastProcess) {
          if (lastProcess != null) {
            var frame = lastProcess.stop(time);
            timeWindows.add(frame);
          }
          process.start(time);
        }
        time++;
        process.advance(1);

        var done = process.remainingTime == 0;
        if (done) {
          doneProcesses++;
          var frame = process.stop(time);
          timeWindows.add(frame);
          readyList.remove(process);
          lastProcess = null;
        } else {
          lastProcess = process;
        }

      } else {
       time++;
      }
    }
    return timeWindows;
  }
}
