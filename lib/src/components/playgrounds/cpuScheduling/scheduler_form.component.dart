import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:os_cpu_schedulers/os_cpu_schedulers.dart';

@Component(
  selector: 'scheduler-form',
  template: '''
  <div>
  <div class="form-group">
    <label for="processTextArea">{{format}}</label>
    <textarea class="form-control" id="processTextArea" rows="5" [placeholder]="placeholder" [(ngModel)]="inputText"></textarea>
    <button class="btn btn-primary mt-2" (click)="calculate()">Calculate</button>
    <button class="btn btn-secondary mt-2" (click)="clear()">Clear</button>
  </div>
  <div *ngIf="output!=null">
    <h5>{{name}} Gantt List:</h5>
    <!--<gantt-chart [times]="times"></gantt-chart>-->
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
  ''',
  directives: [
    coreDirectives,
    formDirectives, /*GanttChart*/
  ],
)
class SchedulerForm {
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
}
