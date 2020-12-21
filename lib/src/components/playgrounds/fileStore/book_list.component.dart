import 'package:angular/angular.dart';

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
  @Input()
  List<Book> books;
}

@Component(
  selector: 'book-card',
  template: '''
    <div class="card card-body my-2">
    <h4 class="pb-2">{{book.title}}</h4>
    <p>{{book.author}}</p>
    <div>
    <a class="btn btn-secondary" type="button" href="">Edit</a>
    <a class="btn btn-danger" type="button" href="">Delete</a>
    </div>
  </div>
  ''',
)
class BookCard {
  @Input()
  Book book;
}
