import 'playground_project.dart';

class Playgrounds {
  static final todo = PlaygroundProject('todo', 'TODO', 'A simple todo app (work in progress)');
  static final os = PlaygroundProject('os', 'OS', 'basic OS problem solver');
  static final wakatime = PlaygroundProject('wakatime', 'WakaTime', 'My programming activity');
  static final personas = PlaygroundProject('personas', 'My Personas', 'My different sides.');

  static final List<PlaygroundProject> playgrounds = [
    todo,
    os,
    wakatime,
    personas,
    //PlaygroundProject('chatroom', 'Chat Room', 'A Simple chat room app', PlaygroundRoutePaths.chatroom),
    //PlaygroundProject('date-converter', 'Date Converter', 'A date converting tool', PlaygroundRoutePaths.dateConverter),
    //PlaygroundProject('paint', 'Paint', 'A Painting App', PlaygroundRoutePaths.paint),
  ];
}
