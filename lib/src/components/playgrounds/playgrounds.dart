import 'playground_project.dart';

class Playgrounds {
  static final todo = PlaygroundProject('todo', 'TODO App', 'A simple todo app (work in progress)',tags: ['persistence','angular-forms']);
  static final os = PlaygroundProject('os', 'OS solver', 'Basic OS problem solver.', tags: ['algorithms', 'bootstrap-table','parsing']);
  static final wakatime = PlaygroundProject('wakatime', 'WakaTime Tracker', 'My programming activity.', tags: ['embedding']);
  static final personas = PlaygroundProject('personas', 'My Personas', 'My different sides.', tags: ['differed loading', 'bootstrap-table']);
  static final fileStore = PlaygroundProject('file-store', 'File Store', 'Library DataStore using files(fs_shim).',tags: ['databases','file','angular-forms']);

  static final List<PlaygroundProject> playgrounds = [
    todo,
    os,
    wakatime,
    personas,
    fileStore,
    //PlaygroundProject('chatroom', 'Chat Room', 'A Simple chat room app', PlaygroundRoutePaths.chatroom),
    //PlaygroundProject('date-converter', 'Date Converter', 'A date converting tool', PlaygroundRoutePaths.dateConverter),
    //PlaygroundProject('paint', 'Paint', 'A Painting App', PlaygroundRoutePaths.paint),
  ];
}
