

import 'package:static_aligator_ir/src/components/playgrounds/fileStore/models/basic/store_object.dart';

abstract class Store<T extends StoreObject>{

  Future<List<T>> getAllElements();

  Future<void> addElement(T element);

  Future<void> removeElementById(String storeId);

  Future<void> replaceElementAt(String storeId, T element);

  Future<T> getElementById(String storeId);
}