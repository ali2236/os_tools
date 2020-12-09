
import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/components/playgrounds/TODO/todo.dart';

@Component(
  selector: 'todo-card',
  template: '''
    <div class="card card-body mb-1">
        <div class="row">
          <div class="card-text col-11" [class.strike-through]="todo.done" [class.ag-text-dark]="todo.done" [innerText]="todo.name"></div>
          <div class="col-1"><button class="btn ml-auto" [class.btn-danger]="!todo.done" [class.btn-secondary]="todo.done" (click)="done()">{{todo.done ? 'undo' : 'done'}}</button></div>
        </div>
    </div>
  ''',
)
class TodoCard {
  @Input()
  Todo todo;

  void done(){
    todo.done = !todo.done;
  }
}