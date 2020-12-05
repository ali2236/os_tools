import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:angular_components/utils/browser/window/new_window_opener.dart';
import 'package:fanoos_http/fanoos_http.dart';

@Component(
  selector: 'powerpoints-page',
  template: '''<div class="container">
    <h1>PowerPoints</h1>
    <br/>
    <table id="powerpoints" class="table table-striped">
        <tbody>
        <tr class="powerpoint-table-row" *ngFor="let pp of powerpoints">
            <td (click)="pp.openDownloadLink()">
              <p><b>{{pp.name}}</b></p>
              <p class="ag-text-dark">{{pp.presented}}</p>
            </td>
            <td class="text-right ag-text-dark">{{pp.date}}</td>
        </tr>
        </tbody>
    </table>
</div>
  ''',
  directives: [coreDirectives],
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
    powerpoints.sort();
  }
}

class PowerPoint implements Comparable<PowerPoint>{
  final String name;
  final String date;
  final String presented;
  final String download;

  PowerPoint(this.name, this.date, this.presented, this.download);

  factory PowerPoint.fromJson(Map<String, dynamic> json) {
    return PowerPoint(json['name'], json['date'], json['presented'], json['download']);
  }

  void openDownloadLink(){
    openInNewWindow(downloadLink);
  }

  String get downloadLink => '/static/upload/powerpoints/$download';

  int get _date => int.tryParse(date.replaceAll('/', ''));

  @override
  int compareTo(PowerPoint other) {
    return other._date.compareTo(_date);
  }
}
