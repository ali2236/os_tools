import 'package:angular/angular.dart';

class PlaygroundProject {
  final String id;
  final String name;
  final String description;
  final String selectorName;
  final ComponentFactory factory;

  PlaygroundProject(this.id, this.name, this.description, this.selectorName, this.factory);

  String get selector => '<$selectorName></$selectorName>';
}
