import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/models/colors.dart';

import '../markdown_component.dart';

@Component(
  selector: 'index-page',
  template: '''<div class="container">
    <div class="row">
        <img [style.background-color]="Colors.background" width="256" height="256"/>
        <div class="ml-4">
            <h1 class="mb-1">Ali "Aligator" Ghanbari</h1>
            <h6>Pure Programmer</h6>
        </div>
    </div>
</div>
  ''',
  directives: [MarkdownComponent],
  exports: [Colors],
)
class IndexPage {
  String a;
}
