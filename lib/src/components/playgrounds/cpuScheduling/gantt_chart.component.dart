import 'dart:math';

import 'package:angular/angular.dart';
import 'package:angular_components/utils/color/color.dart';
import 'package:os_cpu_schedulers/os_cpu_schedulers.dart';

/*
     aria-valuenow="(time.end - time.start)/end"
     aria-valuemin="0"
     aria-valuemax="end"
 */
@Component(selector: 'gantt-chart', template: '''
  <div class="progress" [style.height.px]="25">
    <div class="progress-bar"
     *ngFor="let time of times" 
     role="progressbar"
     [style.background-color]="color"
     [style.width.%]="((time.end - time.start)/end)*100">{{time.label}}</div>
  </div>
  ''', directives: [coreDirectives])
class GanttChart {
  @Input()
  List<TimeWindow> times;

  int get end => times.last.end;

  final random = Random();

  Color get color => Color.fromRgb(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
      );
}
