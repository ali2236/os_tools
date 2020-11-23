import 'dart:html';

import 'package:static_aligator_ir/src/components/playgrounds/TODO/todo.dart';

class TodoController {

  List<Todo> _todo = [];

  void init() async{
   var db = await window.indexedDB.open('todo-app', version: 1);
   var todoStore = db.createObjectStore('todo');

  }

  // CREATE
  void addTodo(String title){

  }

  // READ
  List<Todo> get todos{

  }

  // UPDATE


  // DELETE

}