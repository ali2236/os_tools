
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'avg-memory-time-form',
  template: '''
  <div>
   <div class="form-group">
      <label for="pCache-input">Cache Hit probability(0.0 to 1.0):</label>
      <input #cp id="pCache-input" class="form-control" type="number" min="0.0" max="1.0" [value]="pCacheHit" (keyup)="cacheProb = cp.value">
   </div>
   <div class="form-group">
      <label for="pCache-input">Cache Retrieve Time:</label>
      <input #ct id="pCache-input" class="form-control" type="number" min="0" [value]="tCache" (keyup)="cacheTime = ct.value">
   </div>
   <div class="form-group">
      <label for="pCache-input">Memory Retrieve Time:</label>
      <input #mt id="pCache-input" class="form-control" type="number" min="0" [value]="tMem" (keyup)="memTime = mt.value">
   </div>
   <button class="btn btn-primary" (click)="calculate()">Calculate</button>
   <button class="btn btn-secondary" (click)="clear()">Clear</button>
   <div *ngIf="tAvg!=null">
    <p>Average Time: {{tAvg}}</p>
   </div>
   </div>
  ''',
  directives: [formDirectives, coreDirectives]
)
class AverageMemoryTimeCalculator {

  double tCache = 2, tMem = 8, pCacheHit = 0.8;
  String tAvg;

  set cacheProb(v) => pCacheHit = double.tryParse(v);
  set cacheTime(v) => tCache = double.tryParse(v);
  set memTime(v) => tMem = double.tryParse(v);

  void calculate(){
    tAvg = (tCache + ((1.0-pCacheHit) * tMem)).toStringAsPrecision(3);
  }

  void clear(){
    tAvg = null;
  }

}