import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/services/filestore_service.dart';

import 'models/book.dart';
import 'models/borrow.dart';
import 'models/member.dart';

@Component(
  selector: 'borrow-form',
  template: '''
  <div class="card p-2">
    <div class="card-title text-center">
        <h3>{{formTitle}}</h3>
    </div>
    <div class="card-body">
        <form (ngSubmit)="submit()">
            <div class="form-group">
                <label for="member-select">Member</label>
                 <select class="form-control" [(ngModel)]="borrow.memberId">
                     <option *ngFor="let member of members" [ngValue]="member.storeId">{{member}}</option>
                 </select>
            </div>
            <div class="form-group">
                <label for="book-select">Book</label>
                <select class="form-control" [(ngModel)]="borrow.bookId">
                     <option *ngFor="let book of books" [ngValue]="book.storeId">{{book}}</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</div>
  ''',
  directives: [coreDirectives, formDirectives],
)
class BorrowForm with OnInit{
  @Input()
  Borrow borrow;

  @Input()
  String action;

  @Input()
  VoidCallback onSubmit;

  final FileStoreService fileStoreService;

  List<Book> get books => fileStoreService.books;

  List<Member> get members => fileStoreService.members;

  BorrowForm(this.fileStoreService);

  Borrow getDefaultBorrowing() {
    return Borrow(
      members.isNotEmpty ? members.first.storeId : null,
      books.isNotEmpty ? books.first.storeId : null,
      fileStoreService.stores,
    );
  }


  @override
  void ngOnInit() {
    borrow ??= getDefaultBorrowing();
  }

  String get formTitle => isEdit ? 'Edit Borrowing' : 'Add a new Borrowing';

  bool get isEdit => action == 'edit';

  void submit() async {
    try {
      borrow.validate();
      if (isEdit) {
        await fileStoreService.editBorrowing(borrow);
      } else {
        await fileStoreService.addBorrowing(borrow);
        borrow = getDefaultBorrowing();
      }
      Function.apply(onSubmit ?? (){},const []);
    } catch (e) {
      print(e);
    }
  }
}
