import 'dart:collection';

import 'package:static_aligator_ir/src/components/playgrounds/OS/models/Process.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/models/Scheduler.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/models/TimeWindow.dart';

class FirstComeFirstServed extends CpuScheduler {

  @override
  List<TimeWindow> calculate(List<Process> processes) {
    var time = 0;
    var doneProcesses = 0;
    var waitingQueue = Queue.of(processes);
    var readyQueue = Queue<Process>();
    var timeWindows = <TimeWindow>[];
    while(doneProcesses != processes.length){
      var ready = waitingQueue.where((p) => p.arrivalTime <= time);
      ready.forEach(readyQueue.add);
      waitingQueue.removeWhere((p) => p.arrivalTime <= time);
      if(readyQueue.isNotEmpty){
        var process = readyQueue.removeFirst();
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