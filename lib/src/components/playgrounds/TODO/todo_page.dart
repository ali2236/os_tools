import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:static_aligator_ir/src/components/playgrounds/TODO/todo_card.component.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playground_project.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playgrounds.dart';

import '../playground_page.dart';
import 'todo.dart';

@Component(
  selector: 'todo-page',
  template: '''
    <div class="container">
      <h1>TODO App</h1>
      <div class="my-4">
      <input [(ngModel)]="inputName" placeholder="name" (keyup.enter)="addTodo()">
      <button class="btn btn-primary" (click)="addTodo()">Add</button>
      </div>
      <div *ngFor="let todo of todos">
        <todo-card [todo]="todo"></todo-card>
      </div>
    </div>
  ''',
  directives: [coreDirectives, formDirectives, TodoCard],
)
class TodoPage extends PlaygroundPage{
  String inputName;
  List<Todo> todos = [];
  void addTodo(){
    if(inputName!=null && inputName.isNotEmpty){
      todos.insert(0,Todo(inputName));
      inputName = null;
    }
  }

  @override
  PlaygroundProject get playground => Playgrounds.todo;
}