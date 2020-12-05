import 'basic/codec.dart';
import 'basic/store_object.dart';

const books = 'books';

class Book extends JsonStoreObject {
  final String title;
  final String author;

  Book(this.title, this.author) {
    if (title.isEmpty) throw 'The title field can not be empty';
  }

  @override
  Map<String, dynamic> toJson() => {
        'title': title,
        'author': author,
      };

  @override
  String toString() => '$title';
}

class BookJsonCodec extends JsonObjectCodec<Book> {
  @override
  Book deserializeFromMap(Map<String, dynamic> json) {
    return Book(json['title'], json['author']);
  }
}
