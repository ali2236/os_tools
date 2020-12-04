import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/cpuSchedulers/batch/sjf.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/models/Process.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/models/Scheduler.dart';

import 'cpuSchedulers/batch/fcfs.dart';

@Component(selector: 'os-page', template: '''
  <div class="container">
      <h1>OS Cpu Schedulers</h1>
      <div class="my-4">
        <h3 class="ag-text-accent">FCFS</h3>
        <scheduler-form name="FCFS" [format]="format" [placeholder]="sjfExample" [scheduler]="fcfs"></scheduler-form>
        <h3 class="ag-text-accent">SJF</h3>
        <scheduler-form name="SJF" [format]="format" [placeholder]="sjfExample" [scheduler]="sjf"></scheduler-form>
      </div>
    </div>
  ''', directives: [coreDirectives, formDirectives, SchedulerForm])
class OSPage {
  String format =
      'format: <Process Name> <Service Time> <Arrival Time = 0> \\n';
  String sjfExample = 'P1 24\nP2 3\nP3 3';
  final sjf = ShortestJobFirst();
  final fcfs = FirstComeFirstServed();
}

@Component(selector: 'scheduler-form', template: '''
  <div>
  <div class="form-group">
    <label for="processTextArea">{{format}}</label>
    <textarea class="form-control" id="processTextArea" rows="5" [placeholder]="placeholder" [(ngModel)]="inputText"></textarea>
    <button class="btn btn-primary" (click)="calculate()">Calculate</button>
    <button class="btn btn-secondary" (click)="clear()">Clear</button>
  </div>
  <div id="output" *ngIf="output!=null">
    <h5>{{name}} Gantt List:</h5>
    <p>{{output}}</p>
    <br />
    <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Process</th>
      <th scope="col">Arrival Time</th>
      <th scope="col">Service Time</th>
      <th scope="col">Turnaround Time</th>
      <th scope="col">Response Time</th>
      <th scope="col">Waiting Time</th>
    </tr>
  </thead>
  <tbody>
    <tr *ngFor="let process of tableProcesses">
      <td>{{process.label}}</td>
      <td>{{process.arrivalTime}}</td>
      <td>{{process.serviceTime}}</td>
      <td>{{process.turnaroundTime}}</td>
      <td>{{process.responseTime}}</td>
      <td>{{process.waitingTime}}</td>
    </tr>
  </tbody>
</table>
  <p>Average Turnaround Time: {{ATT}}</p>
  <p>Average Response Time: {{ART}}</p>
  <p>Average Waiting Time: {{AWT}}</p>
  </div>
  </div>
  ''', directives: [coreDirectives, formDirectives])
class SchedulerForm {
  @Input()
  String name;

  @Input()
  String format;

  @Input()
  String placeholder;

  @Input()
  CpuScheduler scheduler;

  String inputText, output;

  List<Process> processes;

  List<Process> get tableProcesses =>
      List.from(processes)..sort((p1, p2) => p1.label.compareTo(p2.label));

  num get ATT =>
      processes.map((e) => e.turnaroundTime).reduce((a, b) => a + b) /
      processes.length;

  num get AWT =>
      processes.map((e) => e.waitingTime).reduce((a, b) => a + b) /
          processes.length;

  num get ART =>
      processes.map((e) => e.responseTime).reduce((a, b) => a + b) /
          processes.length;

  void calculate() {
    var rawInput = inputText ?? placeholder ?? '';
    var row = rawInput.split('\n');
    processes = row.map((s) => Process.fromString(s)).toList();
    output = scheduler.calculate(processes).toString();
  }

  void clear() {
    output = null;
  }
}
