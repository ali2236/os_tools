import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:os_aligator_ir/src/components/playgrounds/cpuScheduling/time_card.component.dart';
import 'package:os_cpu_schedulers/os_cpu_schedulers.dart';

import 'gantt_chart.component.dart';

@Component(
  selector: 'scheduler-form',
  template: '''
  <div>
    <label for="processTextArea">{{format}}</label>
    <textarea class="form-control" id="processTextArea" rows="5" [placeholder]="placeholder" [(ngModel)]="inputText"></textarea>
    <button class="btn btn-primary mt-2" (click)="calculate()">Calculate</button>
    <!--<button class="btn btn-secondary mt-2" (click)="clear()">Clear</button>-->
  <div *ngIf="output!=null">
    <div class="row">
      <div class="col-md-4 col-sm-12 my-3"><time-card title="Average Turnaround Time" [value]="ATT"></time-card></div>
      <div class="col-md-4 col-sm-12 my-3"><time-card title="Average Response Time" [value]="ART"></time-card></div>
      <div class="col-md-4 col-sm-12 my-3"><time-card title="Average Waiting Time" [value]="AWT"></time-card></div>
    </div>
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
        <h5>{{name}} Gantt Chart:</h5>
    <gantt-chart [times]="times"></gantt-chart>
    <!--<p>{{output}}</p>-->
    </div>
  </div>
  ''',
  directives: [
    coreDirectives,
    formDirectives,
    GanttChart,
    TimeCard,
  ],
)
class SchedulerForm with OnInit {
  @Input()
  String name;

  @Input()
  ProcessParser parser;

  @Input()
  String placeholder;

  @Input()
  CpuScheduler scheduler;

  String inputText;

  String get output => times?.toString();

  List<Process> processes;
  List<TimeWindow> times;

  String get format => 'Format: ${parser.template}';

  List<Process> get tableProcesses =>
      List.from(processes)..sort((p1, p2) => p1.label.compareTo(p2.label));

  num get ATT => processes.ATT;

  num get AWT => processes.AWT;

  num get ART => processes.ART;

  void calculate() {
    var rawInput = inputText ?? placeholder ?? '';
    processes = parser.parse(rawInput);
    times = scheduler.calculate(processes);
  }

  void clear() {
    times = null;
  }

  @override
  void ngOnInit() {
    calculate();
  }
}
