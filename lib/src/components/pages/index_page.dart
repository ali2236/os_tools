import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/models/colors.dart';

import '../markdown_component.dart';

@Component(
  selector: 'index-page',
  template: '''
    <h1>Ali "Aligator" Ghanbari</h1>
    <img [style.background-color]="colors.background" src="/static/upload/images/face.png" width="300" height="300"/>
  ''',
  directives: [MarkdownComponent],
)
class IndexPage {
  Colors colors = Colors();
}
