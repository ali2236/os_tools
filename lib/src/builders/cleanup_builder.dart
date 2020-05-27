
import 'dart:async';

import 'package:build/build.dart';

PostProcessBuilder cleanupBuilder(options) => CleanUpBuilder();

class CleanUpBuilder extends FileDeletingBuilder implements PostProcessBuilder{

  CleanUpBuilder() : super(['.md','.mustache'], isEnabled: true);

  @override
  FutureOr<Null> build(PostProcessBuildStep buildStep) async{
    super.build(buildStep);
    log.fine('deleted ${buildStep.inputId.path}');
    return null;
  }

}