
import 'package:build/build.dart';

PostProcessBuilder cleanupBuilder(options) => CleanUpBuilder();

class CleanUpBuilder extends FileDeletingBuilder implements PostProcessBuilder{
  CleanUpBuilder() : super(['.md','.mustache']);
}