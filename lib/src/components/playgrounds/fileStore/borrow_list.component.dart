import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/borrow_form.component.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/services/filestore_service.dart';

import 'models/borrow.dart';

@Component(
  selector: 'borrow-list',
  template: '''
  <div *ngFor="let borrowing of borrows">
    <borrowing-card [borrow]="borrowing"></borrowing-card>  
  </div>
  ''',
  directives: [coreDirectives, BorrowingCard],
)
class BorrowList {
  final FileStoreService fileStoreService;

  List<Borrow> get borrows => fileStoreService.borrowings;

  BorrowList(this.fileStoreService);
}

@Component(selector: 'borrowing-card', template: '''<div>
    <div *ngIf="editMode">
        <borrow-form [borrow]="borrow" action="edit" [onSubmit]="editDone"></borrow-form>
    </div>
    <div *ngIf="!editMode">
        <div class="card card-body my-2">
            <h4 class="pb-2">{{bookTitle | async}}</h4>
            <p>{{memberName | async}}</p>
            <div>
                <a class="btn btn-secondary" type="button" (click)="edit()">Edit</a>
                <a class="btn btn-danger" type="button" (click)="delete()">Delete</a>
            </div>
        </div>
    </div>
</div>''', directives: [coreDirectives, BorrowForm], pipes: [commonPipes])
class BorrowingCard {
  @Input()
  Borrow borrow;

  bool editMode = false;

  final FileStoreService fss;

  BorrowingCard(this.fss);

  Future<String> get bookTitle => borrow.book.then((value) => value.title);

  Future<String> get memberName =>
      borrow.member.then((value) => value.fullName);

  void edit() => editMode = true;

  void editDone() => editMode = false;

  void delete() => fss.deleteBorrowing(borrow);
}
