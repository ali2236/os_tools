import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'average_memory_time.component.dart';
import 'cpuSchedulers/fcfs.dart';
import 'cpuSchedulers/hrrn.dart';
import 'cpuSchedulers/rr.dart';
import 'cpuSchedulers/sjf.dart';
import 'cpuSchedulers/sps.dart';
import 'cpuSchedulers/srt.dart';
import 'cpu_utilization.component.dart';
import 'models/ProcessParser.dart';
import 'scheduler_form.component.dart';

@Component(
  selector: 'os-page',
  template: '''
  <div class="container">
      <h1>OS Cpu Schedulers</h1>
      <div class="my-4">
        <h3 class="ag-text-accent">First Come First Served</h3>
        <scheduler-form name="FCFS" [parser]="atParser" [placeholder]="example1" [scheduler]="fcfs"></scheduler-form>
        <h3 class="ag-text-accent">Shortest Job First</h3>
        <scheduler-form name="SJF" [parser]="atParser" [placeholder]="example1" [scheduler]="sjf"></scheduler-form>
        <h3 class="ag-text-accent">Shortest Remaining Time/Preemptive SJF</h3>
        <scheduler-form name="SRT" [parser]="atParser" [placeholder]="example2" [scheduler]="srt"></scheduler-form>
        <h3 class="ag-text-accent">Highest Response Ratio Next</h3>
        <scheduler-form name="HRRN" [parser]="atParser" [placeholder]="example2" [scheduler]="hrrn"></scheduler-form>
        <h3 class="ag-text-accent">Round Robin</h3>
        <div class="form-group">
          <label for="rrq-input">Quantum:</label>
          <input id="rrq-input" #rrq class="form-control" type="number" value="1" (keyup)="updateRoundRobin(rrq.value)">
          <scheduler-form name="RR" [parser]="atParser" [placeholder]="example2" [scheduler]="rr"></scheduler-form>
        </div>
        <h3 class="ag-text-accent">Static Priority Scheduling</h3>
        <scheduler-form name="SPS" [parser]="prParser" [placeholder]="example3" [scheduler]="sps"></scheduler-form>
      </div>
      <br/>
      <h1>Miscellaneous Calculators</h1>
      <h3 class="ag-text-accent">Average time to access memory:</h3>
      <avg-memory-time-form></avg-memory-time-form>
      <h3 class="ag-text-accent">Multiprogramming Cpu Utilization:</h3>
      <cpu-utilization></cpu-utilization>
    </div>
  ''',
  directives: [
    coreDirectives,
    formDirectives,
    SchedulerForm,
    AverageMemoryTimeCalculator,
    CpuUtilization,
  ],
)
class OSPage {
  final atParser = ArrivalTimeParser();
  final prParser = PriorityProcessParser();
  final example1 = 'P1 24\nP2 3\nP3 3';
  final example2 = 'A 3 0\nB 6 2\nC 4 4\nD 5 6\nE 2 8';
  final example3 = 'P1 10 3\nP2 1 1\nP3 2 4\nP4 1 5\nP5 5 2';
  final sjf = ShortestJobFirst();
  final fcfs = FirstComeFirstServed();
  final srt = ShortestRemainingTime();
  final hrrn = HighestResponseRatioNext();
  var rr = RoundRobin(1);
  final sps = StaticPriorityScheduling();

  void updateRoundRobin(q) => rr = RoundRobin(int.tryParse(q));
}
