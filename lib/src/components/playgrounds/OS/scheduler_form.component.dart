import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:firebase/firebase.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/models/Process.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/models/Scheduler.dart';

import 'models/ProcessParser.dart';

@Component(selector: 'scheduler-form', template: '''
  <div>
  <div class="form-group">
    <label for="processTextArea">{{format}}</label>
    <textarea class="form-control" id="processTextArea" rows="5" [placeholder]="placeholder" [(ngModel)]="inputText"></textarea>
    <button class="btn btn-primary" (click)="calculate()">Calculate</button>
    <button class="btn btn-secondary" (click)="clear()">Clear</button>
  </div>
  <div *ngIf="output!=null">
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
  ProcessParser parser;

  @Input()
  String placeholder;

  @Input()
  CpuScheduler scheduler;

  String inputText, output;

  List<Process> processes;

  String get format => 'Format: ${parser.template}';

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
    processes = parser.parse(rawInput);
    output = scheduler.calculate(processes).toString();

    // analytics
    analytics().logEvent('Calculate $name', {'input': inputText});
  }

  void clear() {
    output = null;

    // analytics
    analytics().logEvent('Clear $name', {});
  }
}
