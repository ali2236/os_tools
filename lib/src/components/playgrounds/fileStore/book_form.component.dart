import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/services/filestore_service.dart';

import 'models/book.dart';

@Component(
  selector: 'book-form',
  template: '''
  <div class="card p-2">
    <div class="card-title text-center">
        <h3>{{formTitle}}</h3>
    </div>
    <div class="card-body">
       <form (ngSubmit)="submit()">
            <div class="form-group">
                <label for="bk-tl">Book Title</label>
                <input id="bk-tl" class="form-control" name="title" type="text" placeholder="Title" [(ngModel)]="book.title" required>
            </div>
            <div class="form-group">
                <label for="bk-ath">Book Author</label>
                <input id="bk-ath" type="text" class="form-control" name="author" placeholder="Author" [(ngModel)]="book.author">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
       </form>
    </div> 
</div>
  ''',
  directives: [formDirectives],
)
class BookForm with OnInit {
  @Input()
  Book book;

  @Input()
  String action;

  @Input()
  VoidCallback onSubmit;

  final FileStoreService fss;

  BookForm(this.fss);

  @override
  void ngOnInit() {
    book ??= Book(null, null);
  }

  String get formTitle => isEdit ? 'Edit Book' : 'Add a new Book';

  bool get isEdit => action == 'edit';

  void submit() async {
    try {
      book.validate();
      if (isEdit) {
        await fss.editBook(book);
      } else {
        await fss.addBook(book);
        book = Book(null, null);
      }
      if(onSubmit!=null) onSubmit();
    } catch (e) {
      print(e);
    }
  }
}
