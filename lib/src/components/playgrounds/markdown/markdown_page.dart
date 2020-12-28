import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/models/page_seo.dart';

@Component(
  selector: 'markdown-page',
  template: '''
  ''',
)
class MarkdownPage extends PageSEO{
  @override
  String get pageTitle => 'Markdown Renderer';

}