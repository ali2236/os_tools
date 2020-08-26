import 'package:angular/angular.dart';

import '../markdown_component.dart';

@Component(
  selector: 'index-page',
  template: '''
    <h1>Ali "Aligator" Ghanbari</h1>
  ''',
  directives: [MarkdownComponent]
)
class IndexPage {
}