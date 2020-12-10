import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/components/page_header.component.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playground_page.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playground_project.dart';

import '../playgrounds.dart';
import 'book_form.component.dart';
import 'models/book.dart';
import 'models/borrow.dart';
import 'models/member.dart';
import 'persistance/stores.dart';

const _basePath = 'filestore';

@Component(
  selector: 'filedb-page',
  template: '''
   <div class="container">
      <page-header [page]="thisPage"></page-header>
      <div class="my-4">
        <book-form name="book" action="create"></book-form>
      </div>
   </div>
  ''',
  directives: [coreDirectives, BookForm, PageHeader],
  providers: [
    ClassProvider(Stores),
  ],
)
class FileStorePage extends PlaygroundPage {

  final Stores stores;

  FileStorePage(this.stores);

  @override
  void ngOnInit() {
    super.ngOnInit();

    final memberCodec = MemberJsonCodec();
    final bookCodec = BookJsonCodec();
    final borrowCodec = BorrowJsonCodec(stores);

    stores.setupJsonStore<Member>(_basePath, members, memberCodec);
    stores.setupJsonStore<Book>(_basePath, books, bookCodec);
    stores.setupJsonStore<Borrow>(_basePath, borrowings, borrowCodec);
  }

  @override
  PlaygroundProject get playground => Playgrounds.fileStore;
}
