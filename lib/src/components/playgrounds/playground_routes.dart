import 'package:angular_router/angular_router.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playground_route_paths.dart';

import '../playgrounds/OS/OS_page.template.dart' as os;
import '../playgrounds/TODO/todo_page.template.dart' as todo;

class PlaygroundRoutes {
  static final routes = [
    RouteDefinition(
      routePath: PlaygroundRoutePaths.todo,
      component: todo.TodoPageNgFactory,
    ),
    RouteDefinition(
      routePath: PlaygroundRoutePaths.os,
      component: os.OSPageNgFactory,
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