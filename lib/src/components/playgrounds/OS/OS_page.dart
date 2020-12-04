import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'cpuSchedulers/fcfs.dart';
import 'cpuSchedulers/hrrn.dart';
import 'cpuSchedulers/rr.dart';
import 'cpuSchedulers/sjf.dart';
import 'cpuSchedulers/srt.dart';
import 'scheduler_form.component.dart';

@Component(
  selector: 'os-page',
  template: '''
  <div class="container">
      <h1>OS Cpu Schedulers</h1>
      <div class="my-4">
        <h3 class="ag-text-accent">First Come First Served</h3>
        <scheduler-form name="FCFS" [format]="format" [placeholder]="example1" [scheduler]="fcfs"></scheduler-form>
        <h3 class="ag-text-accent">Shortest Job First</h3>
        <scheduler-form name="SJF" [format]="format" [placeholder]="example1" [scheduler]="sjf"></scheduler-form>
        <h3 class="ag-text-accent">Shortest Remaining Time/Preemptive SJF</h3>
        <scheduler-form name="SRT" [format]="format" [placeholder]="example2" [scheduler]="srt"></scheduler-form>
        <h3 class="ag-text-accent">Highest Response Ratio Next</h3>
        <scheduler-form name="HRRN" [format]="format" [placeholder]="example2" [scheduler]="hrrn"></scheduler-form>
        <h3 class="ag-text-accent">Round Robin</h3>
        <div class="form-group">
          <label for="rrq-input">Quantum:</label>
          <input id="rrq-input" #rrq class="form-control" type="number" value="1" (keyup)="updateRoundRobin(rrq.value)">
        </div>
        
        <scheduler-form name="RR" [format]="format" [placeholder]="example2" [scheduler]="rr"></scheduler-form>
      </div>
    </div>
  ''',
  directives: [coreDirectives, formDirectives, SchedulerForm],
)
class OSPage {
  String format =
      'format: <Process Name> <Service Time> <Arrival Time = 0> \\n';
  String example1 = 'P1 24\nP2 3\nP3 3';
  String example2 = 'A 3 0\nB 6 2\nC 4 4\nD 5 6\nE 2 8';
  final sjf = ShortestJobFirst();
  final fcfs = FirstComeFirstServed();
  final srt = ShortestRemainingTime();
  final hrrn = HighestResponseRatioNext();
  var rr = RoundRobin(1);

  void updateRoundRobin(q){
    rr = RoundRobin(int.tryParse(q));
  }
}
