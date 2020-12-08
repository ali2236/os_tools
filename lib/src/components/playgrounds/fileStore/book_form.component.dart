import 'package:angular/angular.dart';

import 'models/book.dart';
@Component(
  selector: 'book-form',
  template: '''
  <div class="card p-2">
    <div class="card-title text-center">
        <h3>{{title}}</h3>
    </div>
    <div class="card-body">
            <div class="form-group">
                <label for="bk-tl"> {{name}} Title</label>
                <input id="bk-tl" class="form-control" name="title" type="text" placeholder="Title" [value]="book?.title ?? ''">
            </div>
            <div class="form-group">
                <label for="bk-ath"> {{name}} Author</label>
                <input id="bk-ath" type="text" class="form-control" name="author" placeholder="Author" [value]="book?.author ?? ''">
            </div>
            <button class="btn btn-primary">Submit</button>
    </div> 
</div>
  ''',
)
class BookForm {
  @Input()
  Book book;

  @Input()
  bool isEdit;

  @Input()
  String name;

  String get title => isEdit ? 'Edit $name' : 'Add a new $name';
}