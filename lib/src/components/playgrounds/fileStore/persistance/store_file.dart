import 'package:fs_shim/fs.dart';
import 'package:fs_shim/fs_browser.dart';
import 'package:path/path.dart' as path;
import 'package:static_aligator_ir/src/components/playgrounds/fileStore/models/basic/store_object.dart';

import 'store.dart';


abstract class FileStore<T extends StoreObject> extends Store<T> {
  final String basePath;
  final String name;
  final fs = fileSystemIdb;

  FileStore(String basePath, this.name) : basePath = path.join(basePath, name);


  File getfile(String name) {
    return fs.file(path.join(basePath, name));
  }

  Future<int> _getNextId() async {
    var file = getfile(name);
    if (!(await file.exists())) {
      await file.create(recursive: true);
      await file.writeAsString('0');
    }
    var lastId = int.tryParse(await file.readAsString());
    var nextId = lastId + 1;
    await file.writeAsString(nextId.toString());
    return nextId;
  }

  Future<void> addFile(String contents) async {
    var id = await _getNextId();
    var file = getfile(id.toString());
    await file.create(recursive: true);
    await file.writeAsString(contents);
  }

  Future<Map<String, String>> allFileContents() async{
    var directory = fs.directory(basePath);
    if(!(await directory.exists())) await directory.create(recursive: true);
    var files = await directory.list().toList();
    var contents = <String, String>{};
    var skippedMeta = false;
    for(var i=files.length-1;i>=0;i--){
      var file = files[i];
      var fileName = path.basename(file.path);
      if(!skippedMeta && fileName == name){
        skippedMeta = true;
      } else {
        var f = fs.file(file.path);
        var content = await f.readAsString();
        contents[fileName] = content;
      }
    }
    return contents;
  }
}
