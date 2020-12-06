import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:fanoos_http/fanoos_http.dart';
import 'package:static_aligator_ir/src/components/page_header.component.dart';
import 'package:static_aligator_ir/src/models/page_seo.dart';
import 'package:static_aligator_ir/src/models/powerpoints.dart';

@Component(
  selector: 'powerpoints-page',
  template: '''<div class="container">
    <page-header [page]="thisPage"></page-header>
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
  directives: [coreDirectives, PageHeader],
)
class PowerPointsPage extends PageSEO {
  List<PowerPoint> powerpoints;

  @override
  String get pageTitle => 'PowerPoints';

  @override
  void ngOnInit() async {
    super.ngOnInit();
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


