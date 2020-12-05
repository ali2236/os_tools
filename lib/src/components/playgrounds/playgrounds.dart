import 'playground_project.dart';
import 'playground_route_paths.dart';

class Playgrounds {

   static final List<PlaygroundProject> playgrounds = [
    PlaygroundProject('todo', 'TODO', 'A simple todo app (work in progress)', PlaygroundRoutePaths.todo),
    PlaygroundProject('os', 'OS', 'basic OS problem solver', PlaygroundRoutePaths.os),
    PlaygroundProject('wakatime', 'WakaTime', 'My programming activity', PlaygroundRoutePaths.wakatime),
    //PlaygroundProject('chatroom', 'Chat Room', 'A Simple chat room app', PlaygroundRoutePaths.chatroom),
    //PlaygroundProject('date-converter', 'Date Converter', 'A date converting tool', PlaygroundRoutePaths.dateConverter),
    //PlaygroundProject('paint', 'Paint', 'A Painting App', PlaygroundRoutePaths.paint),
  ];

}

