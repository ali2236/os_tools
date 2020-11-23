import 'package:angular_router/angular_router.dart';
import 'package:static_aligator_ir/src/routing/route_paths.dart';

class PlaygroundRoutePaths {
  static final todo = RoutePath( path: '${RoutePaths.playgrounds.path}/todo');
  static final paint = RoutePath( path: '${RoutePaths.playgrounds.path}/paint');
  static final chatroom = RoutePath( path: '${RoutePaths.playgrounds.path}/chatroom');
  static final dateConverter = RoutePath( path: '${RoutePaths.playgrounds.path}/date-converter');
}