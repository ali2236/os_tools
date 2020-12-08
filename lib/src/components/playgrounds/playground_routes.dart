import 'package:angular_router/angular_router.dart';

import '../playgrounds/OS/OS_page.template.dart' as os;
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
    RouteDefinition(
      routePath: Playgrounds.os.path,
      component: os.OSPageNgFactory,
    ),
    RouteDefinition(
      routePath: Playgrounds.wakatime.path,
      component: wakatime.WakatimePageNgFactory,
    ),
    RouteDefinition(
      routePath: Playgrounds.personas.path,
      component: personas.PersonaPageNgFactory,
    ),
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