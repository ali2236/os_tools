import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playground_card.component.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playground_project.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playground_route_paths.dart';



@Component(
  selector: 'playgrounds-page',
  template: '''
    <div class="container">
        <div class="row">
            <playground-card class="col-4" *ngFor="let playground of playgrounds" [info]="playground"></playground-card>
        </div>
    </div>
  ''',
  directives: [coreDirectives, PlaygroundCard],
)
class PlaygroundsPage {

  List<PlaygroundProject> playgrounds = [
    PlaygroundProject('todo', 'TODO', 'A simple todo app (work in progress)', PlaygroundRoutePaths.todo),
    PlaygroundProject('os', 'OS', 'basic OS problem solver', PlaygroundRoutePaths.os),
    //PlaygroundProject('chatroom', 'Chat Room', 'A Simple chat room app', PlaygroundRoutePaths.chatroom),
    //PlaygroundProject('date-converter', 'Date Converter', 'A date converting tool', PlaygroundRoutePaths.dateConverter),
    //PlaygroundProject('paint', 'Paint', 'A Painting App', PlaygroundRoutePaths.paint),
  ];

}