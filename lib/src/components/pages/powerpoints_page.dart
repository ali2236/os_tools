import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:fanoos_http/fanoos_http.dart';

@Component(
  selector: 'powerpoints-page',
  template: '''
    <div class="container">
    <h1>PowerPoints</h1>
    <br/>
    <div id="powerpoints">
      <ul>
          <powerpoint-row *ngFor="let powerpoint of powerpoints" [powerpoint]="powerpoint"></powerpoint-row>
      </ul>
    </div>
   </div>
  ''',
  directives: [coreDirectives, PowerPointRow]
)
class PowerPointsPage implements OnInit {
  List<PowerPoint> powerpoints;

  @override
  void ngOnInit() async {
    powerpoints = await httpGet<List<PowerPoint>>(
      url: '/api/content/powerpoints.json',
      bodyParser: jsonDecode,
      onOk: (list) {
        return (list as List).reversed.map((e) => PowerPoint.fromJson(e)).toList();
      },
      onResponse: (_) => [],
      onTimeout: () => [],
    );
  }
}

@Component(
  selector: 'powerpoint-row',
  template: '''
  <li><a href="{{downloadLink}}">{{powerpoint.name}}</a></li>
  ''',
)
class PowerPointRow{

  @Input()
  PowerPoint powerpoint;

  String get downloadLink => '/static/upload/powerpoints/${powerpoint.download}';
}

class PowerPoint {
  final String name;
  final String date;
  final String download;

  PowerPoint(this.name, this.date, this.download);

  factory PowerPoint.fromJson(Map<String, dynamic> json) {
    return PowerPoint(json['name'], json['date'], json['download']);
  }
}
