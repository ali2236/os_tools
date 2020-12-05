import 'dart:math';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'cpu-utilization',
  template: '''
  <div>
   <div class="form-group">
      <label for="pCache-input">Number of Processes(n):</label>
      <input #ni id="pCache-input" class="form-control" type="number" [value]="n" (keyup)="nv = ni.value">
   </div>
   <div class="form-group">
      <label for="pCache-input">IO wait percentage(p):</label>
      <input #pi id="pCache-input" class="form-control" type="number" min="0.0" max="1.0" [value]="p" (keyup)="pv = pi.value">
   </div>
   <button class="btn btn-primary" (click)="calculate()">Calculate</button>
   <button class="btn btn-secondary" (click)="clear()">Clear</button>
    <div *ngIf="utilization!=null">
    <p>CPU utilization: {{utilization}}%</p>
   </div>
  </div>
  ''',
  directives: [formDirectives, coreDirectives]
)
class CpuUtilization {
  int n = 3;
  double p = 0.8;
  var utilization;
  set nv(v) => n = int.tryParse(v);
  set pv(v) => p = double.tryParse(v);

  void calculate(){
    utilization = ((1 - pow(p, n)) * 100).toStringAsPrecision(4);
  }

  void clear(){
    utilization = null;
  }
}