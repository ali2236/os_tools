import 'playground_project.dart';

class Playgrounds {
  static final todo = PlaygroundProject('todo', 'TODO', 'A simple todo app (work in progress)',tags: ['persistence']);
  static final os = PlaygroundProject('os', 'OS', 'basic OS problem solver', tags: ['algorithms', 'bootstrap-table','parsing']);
  static final wakatime = PlaygroundProject('wakatime', 'WakaTime', 'My programming activity', tags: ['embedding']);
  static final personas = PlaygroundProject('personas', 'My Personas', 'My different sides.', tags: ['differed loading', 'bootstrap-table']);
  static final fileStore = PlaygroundProject('fileStore', 'File Store', 'Library DataStore using files(fs_shim).',tags: ['databases','file','angular-forms']);

  static final List<PlaygroundProject> playgrounds = [
    todo,
    os,
    wakatime,
    personas,
    //fileStore,
    //PlaygroundProject('chatroom', 'Chat Room', 'A Simple chat room app', PlaygroundRoutePaths.chatroom),
    //PlaygroundProject('date-converter', 'Date Converter', 'A date converting tool', PlaygroundRoutePaths.dateConverter),
    //PlaygroundProject('paint', 'Paint', 'A Painting App', PlaygroundRoutePaths.paint),
  ];
}
