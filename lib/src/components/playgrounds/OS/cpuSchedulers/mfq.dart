import 'dart:collection';

import 'package:os_aligator_ir/src/components/playgrounds/OS/models/Process.dart';
import 'package:os_aligator_ir/src/components/playgrounds/OS/models/Scheduler.dart';
import 'package:os_aligator_ir/src/components/playgrounds/OS/models/TimeWindow.dart';

///
/// Level 1: RR
/// Level 2: RR
/// Level 3: FCFS
///
class MultiLevelFeedbackQueue implements CpuScheduler {
  final int quantum1, quantum2;

  MultiLevelFeedbackQueue(this.quantum1, this.quantum2);

  @override
  List<TimeWindow> calculate(List<Process> processes) {
    var time = 0;
    var doneProcesses = 0;
    var waitingQueue = Queue.of(processes);
    var rrQueue1 = Queue<Process>();
    var rrQueue2 = Queue<Process>();
    var fcfsQueue = Queue<Process>();
    var timeWindows = <TimeWindow>[];

    void addReadyProccess() {
      var ready = waitingQueue.where((p) => p.arrivalTime <= time);
      ready.forEach(rrQueue1.add);
      waitingQueue.removeWhere((p) => p.arrivalTime <= time);
    }

    addReadyProccess();

    while (doneProcesses != processes.length) {
      if (rrQueue1.isNotEmpty) {
        var process = rrQueue1.removeFirst();
        process.start(time);
        for (var i = 0; i < quantum1 && process.remainingTime != 0; i++) {
          time++;
          process.advance(1);
          addReadyProccess();
        }
        var frame = process.stop(time);
        timeWindows.add(frame);
        if (process.remainingTime == 0) {
          doneProcesses++;
        } else {
          rrQueue2.add(process);
        }
      } else if (rrQueue2.isNotEmpty) {
        var process = rrQueue2.removeFirst();
        process.start(time);
        for (var i = 0; i < quantum2 && process.remainingTime != 0; i++) {
          time++;
          process.advance(1);
          addReadyProccess();
        }
        var frame = process.stop(time);
        timeWindows.add(frame);
        if (process.remainingTime == 0) {
          doneProcesses++;
        } else {
          fcfsQueue.add(process);
        }
      } else if (fcfsQueue.isNotEmpty) {
        var process = fcfsQueue.removeFirst();
        doneProcesses++;
        var frame = process.runNonPreemptive(time);
        time = frame.end;
        timeWindows.add(frame);
      } else {
        time++;
        addReadyProccess();
      }
    }

    return timeWindows;
  }
}
