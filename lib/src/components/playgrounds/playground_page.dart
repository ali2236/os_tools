import 'package:os_aligator_ir/src/components/playgrounds/playground_project.dart';
import 'package:os_aligator_ir/src/models/page_seo.dart';

abstract class PlaygroundPage extends PageSEO {

  PlaygroundProject get playground;

  @override
  String get pageTitle => playground.name;

  @override
  String get pageDescription => playground.description;

}