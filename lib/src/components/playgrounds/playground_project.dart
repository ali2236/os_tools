import 'package:angular_router/angular_router.dart';
import 'package:static_aligator_ir/src/routing/route_paths.dart';

class PlaygroundProject {
  final String id;
  final String name;
  final String description;

  PlaygroundProject(this.id, this.name, this.description);

  @override
  String toString() {
    return '$id($name,$description,/${path.path})';
  }

  RoutePath get path =>  RoutePath(path: '${RoutePaths.playgrounds.path}/$id');
}
