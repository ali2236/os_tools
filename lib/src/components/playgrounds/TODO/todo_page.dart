import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:static_aligator_ir/src/components/playgrounds/TODO/todo_card.component.dart';

import 'todo.dart';

@Component(
  selector: 'todo-page',
  template: '''
    <div class="container">
      <h1>TODO App</h1>
      <div class="my-4">
      <input [(ngModel)]="inputName" placeholder="name" (keyup.enter)="addTodo()">
      <button (click)="addTodo()">Add</button>
      </div>
      <div *ngFor="let todo of todos">
        <todo-card [todo]="todo"></todo-card>
      </div>
    </div>
  ''',
  directives: [coreDirectives, formDirectives, TodoCard],
)
class TodoPage {
  String inputName;
  List<Todo> todos = [];
  void addTodo(){
    if(inputName!=null && inputName.isNotEmpty){
      todos.insert(0,Todo(inputName));
      inputName = null;
    }
  }
}