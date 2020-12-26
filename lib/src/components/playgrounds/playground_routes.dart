import 'package:angular_router/angular_router.dart';

import '../playgrounds/OS/OS_page.template.dart' deferred as os;
import '../playgrounds/TODO/todo_page.template.dart' as todo;
import '../playgrounds/personas/personas_page.template.dart' as personas;
import '../playgrounds/wakatime/wakatime_page.template.dart' as wakatime;
import 'playgrounds.dart';

class PlaygroundRoutes {
  static final routes = [
    RouteDefinition(
      routePath: Playgrounds.todo.path,
      component: todo.TodoPageNgFactory,
    ),
    RouteDefinition.defer(
      routePath: Playgrounds.os.path,
      loader: () async {
        await os.loadLibrary();
        return os.OSPageNgFactory;
      }
    ),
    RouteDefinition(
      routePath: Playgrounds.wakatime.path,
      component: wakatime.WakatimePageNgFactory,
    ),
    RouteDefinition(
      routePath: Playgrounds.personas.path,
      component: personas.PersonaPageNgFactory,
    ),
/*    RouteDefinition.defer(
      routePath: Playgrounds.fileStore.path,
      loader: () async {
        await filestore.loadLibrary();
        return filestore.FileStorePageNgFactory;
      }
    ),*/
/*    RouteDefinition(
      routePath: PlaygroundRoutePaths.paint,
      component: todo.TodoPageNgFactory,
    ),
    RouteDefinition(
      routePath: PlaygroundRoutePaths.chatroom,
      component: todo.TodoPageNgFactory,
    ),
    RouteDefinition(
      routePath: PlaygroundRoutePaths.dateConverter,
      component: todo.TodoPageNgFactory,
    ),*/
  ];
}