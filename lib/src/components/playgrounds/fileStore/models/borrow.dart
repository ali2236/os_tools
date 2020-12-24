import 'package:static_aligator_ir/src/components/playgrounds/fileStore/persistance/stores.dart';

import 'basic/codec.dart';
import 'basic/store_object.dart';
import 'book.dart';
import 'member.dart';

const borrowings = 'borrowings';

class Borrow extends JsonStoreObject {
  final Stores stores;
  String memberId;
  String bookId;

  Borrow(this.memberId, this.bookId, this.stores);

  Future<Member> get member => stores.getStore<Member>().getElementById(memberId);

  Future<Book> get book => stores.getStore<Book>().getElementById(bookId);

  @override
  Map<String, dynamic> toJson() => {
        'memberId': memberId,
        'bookId': bookId,
      };

  @override
  Future<bool> match(String query) async =>
      ((await book)?.match(query) ?? false) ||
      ((await member)?.match(query) ?? false);
}

class BorrowJsonCodec extends JsonObjectCodec<Borrow> {
  final Stores stores;

  BorrowJsonCodec(this.stores);

  @override
  Borrow deserializeFromMap(Map<String, dynamic> json) {
    return Borrow(json['memberId'], json['bookId'], stores);
  }
}
