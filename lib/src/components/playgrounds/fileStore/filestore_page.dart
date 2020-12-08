import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/components/page_header.component.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playground_page.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playground_project.dart';

import '../playgrounds.dart';
import 'book_form.component.dart';

@Component(
  selector: 'filedb-page',
  template: '''
   <div class="container">
      <page-header [page]="thisPage"></page-header>
      <div class="my-4">
        <book-form name="book" [isEdit]="false"></book-form>
      </div>
   </div>
  ''',
  directives: [coreDirectives, BookForm, PageHeader],
)
class FileDBPage extends PlaygroundPage {
  @override
  PlaygroundProject get playground => Playgrounds.fileStore;
}
