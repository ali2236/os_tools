import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:static_aligator_ir/src/components/page_header.component.dart';
import 'package:static_aligator_ir/src/components/playgrounds/TODO/todo_card.component.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playground_back_button.component.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playground_project.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playgrounds.dart';

import '../playground_page.dart';
import 'todo.dart';

@Component(
  selector: 'todo-page',
  template: '''
    <div class="container">
      <playground-back-button></playground-back-button>      
      <page-header [page]="thisPage"></page-header>
      <div class="my-4">
      <div class="card card-body">
      <div class="form-group">
        <label for="todo-name">Add a new todo task:</label>
        <input id="todo-name" class="form-control" [(ngModel)]="inputName" placeholder="name" (keyup.enter)="addTodo()">
        <button class="btn btn-primary mt-2 px-4" (click)="addTodo()">Add</button>
      </div>
      </div>
      </div>
      <div *ngFor="let todo of todos">
        <todo-card [todo]="todo"></todo-card>
      </div>
    </div>
  ''',
  directives: [
    coreDirectives,
    formDirectives,
    TodoCard,
    PageHeader,
    PlaygroundBackButton,
  ],
)
class TodoPage extends PlaygroundPage {
  String inputName;
  List<Todo> todos = [];

  void addTodo() {
    if (inputName != null && inputName.isNotEmpty) {
      todos.insert(0, Todo(inputName));
      inputName = null;
    }
  }

  @override
  PlaygroundProject get playground => Playgrounds.todo;
}
