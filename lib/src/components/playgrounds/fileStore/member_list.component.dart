import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/member_form.component.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/services/filestore_service.dart';

import 'models/member.dart';

@Component(
  selector: 'member-list',
  template: '''
  <div *ngFor="let member of members">
    <member-card [member]="member"></member-card>
  </div>
  ''',
  directives: [coreDirectives, MemberCard]
)
class MemberList {

  final FileStoreService fss;

  MemberList(this.fss);

  List<Member> get members => fss.members;
}

@Component(
  selector: 'member-card',
  template: '''
  <div>
  <div *ngIf="editMode">
    <member-form [member]="member" action="edit" [onSubmit]="editDone"></member-form>
  </div>
  <div *ngIf="!editMode">
  <div class="card card-body my-2">
    <h4 class="pb-2">{{member.firstName}} {{member.lastName}}</h4>
    <p>First Name: {{member.firstName}}</p>
    <p>Last Name: {{member.lastName}}</p>
    <div>
    <a class="btn btn-secondary" type="button" (click)="edit()">Edit</a>
    <a class="btn btn-danger" type="button" (click)="delete()">Delete</a>
    </div>
  </div>
  </div>
  </div>
  ''',
  directives: [coreDirectives, MemberForm]
)
class MemberCard {
  @Input()
  Member member;

  bool editMode = false;

  final FileStoreService fss;

  MemberCard(this.fss);

  void edit() => editMode = true;

  void editDone()=> editMode = false;

  void delete() => fss.deleteMember(member);
}