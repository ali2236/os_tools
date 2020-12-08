import 'package:static_aligator_ir/src/components/playgrounds/fileStore/models/basic/codec.dart';
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/models/basic/store_object.dart';

import 'store_file.dart';

class JsonFileStore<T extends JsonStoreObject> extends FileStore<T>{

  final JsonObjectCodec<T> codec;

  JsonFileStore(String name, String basePath,this.codec) : super(basePath, name);

  @override
  Future<void> addElement(T element) async{
     await addFile(codec.serialize(element));
  }

  @override
  Future<List<T>> getAllElements() async{
    var allContents = await allFileContents();
    var elements = List<T>(allContents.length);
    var i = 0;
    allContents.forEach((id, source) {
      var model = codec.deserialize(source);
      model.storeId = id;
      elements[i++] = model;
    });
    return elements;
  }

  @override
  Future<T> getElementById(String storeId) async{
    var file = getfile(storeId);
    if(await file.exists()){
      return codec.deserialize(await file.readAsString())..storeId = storeId;
    } else {
      return null;
    }
  }

  @override
  Future<void> removeElementById(String storeId) async{
    var file = getfile(storeId);
    if(await file.exists()){
      await file.delete();
    }
  }

  @override
  Future<void> replaceElementAt(String storeId, T element) async{
    var file = getfile(storeId);
    if(await file.exists()){
      var contents = codec.serialize(element);
      await file.writeAsString(contents);
    } else {
      throw "element #$storeId can not be replaced because it doesn't exist!";
    }
  }

}