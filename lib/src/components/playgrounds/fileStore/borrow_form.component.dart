import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'models/book.dart';
import 'models/borrow.dart';
import 'models/member.dart';
import 'persistance/store.dart';
import 'persistance/stores.dart';

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
                 <select class="form-control" id="member-select" name="memberId" [(ngModel)]="borrow.memberId">
                     <option *ngFor="let member of members" [ngValue]="member.storeId">{{member}}</option>
                 </select>
            </div>
            <div class="form-group">
                <label for="book-select">Book</label>
                <select class="form-control" id="book-select" name="bookId" [(ngModel)]="borrow.bookId">
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
class BorrowForm with OnInit {
  @Input()
  Borrow borrow;

  @Input()
  String action;

  @Input()
  VoidCallback refresh;

  @Input()
  List<Book> books = [];

  @Input()
  List<Member> members = [];

  final Stores stores;

  BorrowForm(this.stores);

  @override
  void ngOnInit() {
    borrow ??= Borrow(null, null, stores);
  }

  String get formTitle => isEdit ? 'Edit Borrowing' : 'Add a new Borrowing';

  bool get isEdit => action == 'edit';

  Store<Borrow> get borrowStore => stores.getStore<Borrow>();

  void submit() async {
    try {
      if (isEdit) {
        await borrowStore.replaceElementAt(borrow.storeId, borrow);
      } else {
        await borrowStore.addElement(borrow);
        borrow = Borrow(null, null, stores);
      }
      refresh();
    } catch (e) {
      print(e);
    }
  }
}
