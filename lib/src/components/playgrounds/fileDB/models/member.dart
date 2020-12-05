import 'basic/codec.dart';
import 'basic/store_object.dart';

const members = 'members';

class Member extends JsonStoreObject {
  final String firstName;
  final String lastName;

  Member(this.firstName, this.lastName) {
    if (firstName.isEmpty) throw 'first name can not be empty';
    if (lastName.isEmpty) throw 'last name can not be empty';
  }

  @override
  Map<String, dynamic> toJson() => {
      'firstName': firstName,
      'lastName': lastName,
    };

  @override
  String toString() => '$firstName $lastName';
}

class MemberJsonCodec extends JsonObjectCodec<Member>{
  @override
  Member deserializeFromMap(Map<String, dynamic> json) {
    return Member(json['firstName'], json['lastName']);
  }

}