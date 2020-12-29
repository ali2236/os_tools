import 'dart:html';

import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/book_form.component.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/services/filestore_service.dart';

import 'models/book.dart';

@Component(
  selector: 'book-list',
  template: '''
  <div *ngFor="let book of books">
    <book-card [book]="book"></book-card>  
  </div>
  ''',
  directives: [coreDirectives, BookCard],
)
class BookList {
  final FileStoreService fss;

  BookList(this.fss);

  List<Book> get books => fss.books;
}

@Component(
  selector: 'book-card',
  template: '''<div>
    <div *ngIf="editMode">
        <book-form [book]="book" action="edit" [onSubmit]="editDone"></book-form>
    </div>
    <div *ngIf="!editMode">
        <div class="card card-body my-2">
            <h4 class="pb-2">{{book.title}}</h4>
            <p>{{book.author}}</p>
            <div>
                <a class="btn btn-secondary" type="button" (click)="edit()">Edit</a>
                <a class="btn btn-danger" type="button" (click)="delete()">Delete</a>
            </div>
        </div>
    </div>
</div>''',
  directives: [coreDirectives, BookForm],
)
class BookCard {
  @Input()
  Book book;

  @Input()
  VoidCallback refresh;

  bool editMode = false;

  final FileStoreService fss;

  BookCard(this.fss);

  void edit() => editMode = true;

  void editDone()=> editMode = false;

  void delete() => fss.deleteBook(book);
}
