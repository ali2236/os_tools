import 'package:angular_router/angular_router.dart';

class PlaygroundProject {
  final String id;
  final String name;
  final String description;
  final RoutePath path;

  PlaygroundProject(this.id, this.name, this.description, this.path);

  @override
  String toString() {
    return '$id($name,$description,/${path.path})';
  }
}
