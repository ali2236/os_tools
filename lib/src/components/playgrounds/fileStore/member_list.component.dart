import 'package:angular/angular.dart';

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
  @Input()
  List<Member> members;
}

@Component(
  selector: 'member-card',
  template: '''
  <div class="card card-body my-2">
    <h4 class="pb-2">{{member.firstName}} {{member.lastName}}</h4>
    <p>First Name: {{member.firstName}}</p>
    <p>Last Name: {{member.lastName}}</p>
    <div>
    <a class="btn btn-secondary" type="button" href="">Edit</a>
    <a class="btn btn-danger" type="button" href="">Delete</a>
    </div>
  </div>
  ''',
)
class MemberCard {
  @Input()
  Member member;
}