import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/models/page_seo.dart';

@Component(
  selector: 'page-header',
  template: '''
  <h2>{{page.pageTitle}}</h2>
  <p>{{page.pageDescription}}</p>
  ''',
)
class PageHeader {
  @Input()
  PageSEO page;
}