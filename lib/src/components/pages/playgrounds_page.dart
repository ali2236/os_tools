import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:static_aligator_ir/src/components/playground/playground_card.component.dart';
import 'package:static_aligator_ir/src/components/playground/playground_project.dart';

import '../playground/TODO/todo_page.template.dart' as todo;

@Component(
  selector: 'playgrounds-page',
  template: '''<div [ngSwitch]="active">
    <div *ngSwitchDefault class="container">
        <div class="row">
            <playground-card class="col-4" *ngFor="let playground of playgrounds" [info]="playground"></playground-card>
        </div>
    </div>
    <div *ngFor="let pg of playgrounds">
        <div *ngSwitchCase="pg.id"></div>
    </div>
</div>
  ''',
  directives: [coreDirectives, PlaygroundCard],
)
class PlaygroundsPage {
  final Router router;
  PlaygroundsPage(this.router) {
    router.onRouteActivated.listen((event) {
      active = event.queryParameters['active'];
      print(active);

    });
  }

  String active;

  List<PlaygroundProject> playgrounds = [
    PlaygroundProject('todo', 'TODO', 'A simple todo app','todo-page', todo.TodoPageNgFactory),
    //PlaygroundProject('chatroom', 'Chat Room', 'A Simple chat room app','chatroom-page'),
    //PlaygroundProject('date-converter', 'Date Converter', 'A date converting tool','date-converter-page'),
    //PlaygroundProject('paint', 'Paint', 'A Painting App','paint-page'),
  ];

}