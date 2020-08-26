import 'package:angular/angular.dart';

import '../pipes/markdown_pipe.dart';

@Component(
  selector: 'markdown',
  template: '''<div [innerHTML]="value | md"></div>''',
  directives: [coreDirectives],
  pipes: [MarkdownPipe],
)
class MarkdownComponent {
  @Input()
  String value = '';
}