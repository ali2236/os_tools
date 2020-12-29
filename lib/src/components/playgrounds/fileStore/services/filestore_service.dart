import 'package:static_aligator_ir/src/components/playgrounds/fileStore/models/book.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/models/borrow.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/models/member.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/persistance/store.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/persistance/stores.dart';

const _basePath = 'filestore';

class FileStoreService {
  final Stores stores;

  FileStoreService(this.stores){
    init();
    refresh();
  }

  factory FileStoreService.create(Stores stores) => FileStoreService(stores);

  List<Book> books;
  List<Member> members;
  List<Borrow> borrowings;

  bool get stable => books != null && members != null && borrowings != null;

  Store<Borrow> get borrowStore => stores.getStore<Borrow>();

  Store<Member> get memberStore => stores.getStore<Member>();

  Store<Book> get bookStore => stores.getStore<Book>();

  void init() {
    final memberCodec = MemberJsonCodec();
    final bookCodec = BookJsonCodec();
    final borrowCodec = BorrowJsonCodec(stores);

    stores.setupJsonStore<Member>(_basePath, 'members', memberCodec);
    stores.setupJsonStore<Book>(_basePath, 'books', bookCodec);
    stores.setupJsonStore<Borrow>(_basePath, 'borrowings', borrowCodec);

    refresh();
  }

  Future<void> refresh() {
    return Future.wait([
      bookStore.getAllElements().then((value1) => books = value1),
      memberStore.getAllElements().then((value) => members = value),
      borrowStore.getAllElements().then((value) => borrowings = value),
    ]);
  }

  Future<void> addBorrowing(Borrow borrow) async {
    await borrowStore.addElement(borrow);
    await refresh();
  }

  Future<void> editBorrowing(Borrow borrow) async {
    await borrowStore.replaceElementAt(borrow.storeId, borrow);
    await refresh();
  }

  Future<void> deleteBorrowing(Borrow borrow) async {
    await borrowStore.removeElementById(borrow.storeId);
    await refresh();
  }

  Future<void> addMember(Member member) async {
    await memberStore.addElement(member);
    await refresh();
  }

  Future<void> editMember(Member member) async {
    await memberStore.replaceElementAt(member.storeId, member);
    await refresh();
  }

  Future<void> deleteMember(Member member) async {
    await memberStore.removeElementById(member.storeId);
    await refresh();
  }

  Future<void> addBook(Book book) async {
    await bookStore.addElement(book);
    await refresh();
  }

  Future<void> editBook(Book book) async {
    await bookStore.replaceElementAt(book.storeId, book);
    await refresh();
  }

  Future<void> deleteBook(Book book) async {
    await bookStore.removeElementById(book.storeId);
    await refresh();
  }
}
