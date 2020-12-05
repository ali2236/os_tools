import 'package:static_aligator_ir/src/components/playgrounds/fileDB/persistance/stores.dart';

import 'basic/codec.dart';
import 'basic/store_object.dart';
import 'book.dart';
import 'member.dart';

const borrowings = 'borrowings';

class Borrow extends JsonStoreObject {
  final String memberId;
  final String bookId;

  Borrow(this.memberId, this.bookId);

  Future<Member> get member => getStore<Member>().getElementById(memberId);

  Future<Book> get book => getStore<Book>().getElementById(bookId);

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
  @override
  Borrow deserializeFromMap(Map<String, dynamic> json) {
    return Borrow(json['memberId'], json['bookId']);
  }
}
