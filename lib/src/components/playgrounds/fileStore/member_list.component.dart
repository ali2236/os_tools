import 'dart:html';

import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/member_form.component.dart';

import 'models/member.dart';
import 'persistance/store.dart';
import 'persistance/stores.dart';

@Component(
  selector: 'member-list',
  template: '''
  <div *ngFor="let member of members">
    <member-card [member]="member" [refresh]="refresh"></member-card>
  </div>
  ''',
  directives: [coreDirectives, MemberCard]
)
class MemberList {
  @Input()
  List<Member> members;

  @Input()
  VoidCallback refresh;
}

@Component(
  selector: 'member-card',
  template: '''
  <div>
  <div *ngIf="editMode">
    <member-form [member]="member" action="edit" [refresh]="editDone"></member-form>
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

  @Input()
  VoidCallback refresh;

  bool editMode = false;

  final Stores stores;

  Store<Member> get memberStore => stores.getStore<Member>();

  MemberCard(this.stores);

  void edit() => editMode = true;

  void editDone()=> editMode = false;

  void delete() async{
    await memberStore.removeElementById(member.storeId);
    refresh();
  }
}