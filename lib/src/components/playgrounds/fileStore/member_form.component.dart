import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/models/member.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/services/filestore_service.dart';


@Component(selector: 'member-form', template: '''
  <div class="card p-2">
    <div class="card-title text-center">
        <h3>{{formTitle}}</h3>
    </div>
    <div class="card-body">
        <form (ngSubmit)="submit()">
            <div class="form-group">
                <label for="std-fn">Member First Name</label>
                <input id="std-fn" class="form-control" name="firstName" type="text" placeholder="First Name" [(ngModel)]="member.firstName" required>
            </div>
            <div class="form-group">
                <label for="std-ln">Member Last Name</label>
                <input id="std-ln" type="text" class="form-control" name="lastName" placeholder="Last Name" [(ngModel)]="member.lastName" required>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</div>
  ''', directives: [formDirectives])
class MemberForm with OnInit {
  @Input()
  Member member;

  @Input()
  String action;

  @Input()
  VoidCallback onSubmit;

  final FileStoreService fss;

  MemberForm(this.fss);

  @override
  void ngOnInit() {
    member ??= Member(null, null);
  }

  String get formTitle => isEdit ? 'Edit Member' : 'Add a new Member';

  bool get isEdit => action == 'edit';

  void submit() async {
    try {
      member.validate();
      if (isEdit) {
        await fss.editMember(member);
      } else {
        await fss.addMember(member);
        member = Member(null, null);
      }
      if(onSubmit!=null) onSubmit();
    } catch (e) {
      print(e);
    }
  }
}
