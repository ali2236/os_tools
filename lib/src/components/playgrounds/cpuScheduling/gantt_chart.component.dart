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
  <div class="progress" [style.height.px]="42">
    <div class="progress-bar"
     *ngFor="let time of times" 
     role="progressbar"
     [style.background-color]="getColor(time)"
     [style.width.%]="((time.end - time.start)/end)*100">{{time.label}}</div>
  </div>
  ''', directives: [coreDirectives])
class GanttChart {
  @Input()
  List<TimeWindow> times;

  int get end => times.last.end;

  final random = Random();

  var ca = {};

  var counter = 0;
  Color getColor(TimeWindow tw){
    if(ca.containsKey(tw.label)) return ca[tw.label];
    ca.addAll({
      tw.label : colors[counter++%colors.length],
    });
    return getColor(tw);
  }

  final colors = [
    Color.parse('#03A696'),
    Color.parse('#04D9C4'),
    Color.parse('#014040'),
    Color.parse('#10898D'),
    Color.parse('#217B7E'),
    Color.parse('#046169'),
    Color.parse('#02474D'),
    Color.parse('#032F3C'),
  ];
}
