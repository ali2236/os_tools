import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/components/page_header.component.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/book_list.component.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/borrow_form.component.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/member_form.component.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/member_list.component.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/services/filestore_service.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playground_page.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playground_project.dart';

import '../playgrounds.dart';
import 'book_form.component.dart';
import 'borrow_list.component.dart';
import 'models/book.dart';
import 'models/borrow.dart';
import 'models/member.dart';
import 'persistance/stores.dart';

@Component(
  selector: 'filedb-page',
  template: '''<div>
    <div class="container">
        <page-header [page]="thisPage"></page-header>
    </div>
    <div class="row">
        <div class="col-4">
            <member-form action="create"></member-form>
            <member-list *ngIf="fss.stable"></member-list>
        </div>
        <div class="col-4">
            <book-form action="create"></book-form>
            <book-list *ngIf="fss.stable"></book-list>
        </div>
        <div *ngIf="fss.stable" class="col-4">
            <borrow-form action="create"></borrow-form>
            <borrow-list></borrow-list>
        </div>
    </div>
</div>
  ''',
  directives: [
    coreDirectives,
    BookForm,
    PageHeader,
    BookList,
    MemberList,
    MemberForm,
    BorrowForm,
    BorrowList
  ],
  pipes: [commonPipes],
  providers: [
    ClassProvider(Stores),
    ClassProvider(FileStoreService),
  ],
)
class FileStorePage extends PlaygroundPage {
  final FileStoreService fss;

  FileStorePage(this.fss);

  List<Book> get booksList => fss.books;

  List<Member> get memberList => fss.members;

  List<Borrow> get borrowList => fss.borrowings;

  @override
  PlaygroundProject get playground => Playgrounds.fileStore;
}
