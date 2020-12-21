import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/components/page_header.component.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/book_list.component.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/member_list.component.dart';
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
  template: '''<div>
    <div class="container">
        <page-header [page]="thisPage"></page-header>
        <button (click)="refresh()">Refresh</button>
    </div>
    <div class="row">
        <div class="col-4">
            <member-list [members]="memberList"></member-list>
        </div>
        <div class="col-4">
            <book-form name="book" action="create" [onSubmit]="refresh"></book-form>
            <book-list [books]="booksList"></book-list>
        </div>
    </div>
</div>
  ''',
  directives: [coreDirectives, BookForm, PageHeader, BookList, MemberList],
  pipes: [commonPipes],
  providers: [ClassProvider(Stores)],
)
class FileStorePage extends PlaygroundPage {
  final Stores stores;

  FileStorePage(this.stores);

  List<Book> booksList = [];
  List<Member> memberList = [];
  List<Borrow> borrowList = [];

  @override
  void ngOnInit() {
    super.ngOnInit();

    final memberCodec = MemberJsonCodec();
    final bookCodec = BookJsonCodec();
    final borrowCodec = BorrowJsonCodec(stores);

    stores.setupJsonStore<Member>(_basePath, members, memberCodec);
    stores.setupJsonStore<Book>(_basePath, books, bookCodec);
    stores.setupJsonStore<Borrow>(_basePath, borrowings, borrowCodec);

    refresh();
  }

  void refresh() {
    stores.getStore<Book>().getAllElements().then((value) => booksList = value);
    stores
        .getStore<Member>()
        .getAllElements()
        .then((value) => memberList = value);
    stores
        .getStore<Borrow>()
        .getAllElements()
        .then((value) => borrowList = value);
  }

  @override
  PlaygroundProject get playground => Playgrounds.fileStore;
}
