import 'dart:convert';

import 'searchable.dart';

abstract class StoreObject {
  dynamic storeId;
}

abstract class JsonStoreObject extends StoreObject implements Searchable {
  Map<String, dynamic> toJson();

  @override
  Future<bool> match(String query) async{
    var q = query.toLowerCase();
    return toJson()
        .values
        .map((e) => e.toString().toLowerCase())
        .map((e) => e.contains(q))
        .reduce((value, element) => value || element);
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}