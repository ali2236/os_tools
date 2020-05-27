import 'dart:async';

import 'package:build/build.dart';

Builder minifiedBuilder(_) => MinifierBuilder();

class MinifierBuilder implements Builder {


  @override
  Map<String, List<String>> get buildExtensions => {
    '.css' : ['.css']
  };

  @override
  FutureOr<void> build(BuildStep buildStep) async{
    final inputId = buildStep.inputId;
    final outputId = inputId.changeExtension('.min.css');

    final source = await buildStep.readAsString(inputId);

    final minified = source.replaceAll(' ', '');

    await buildStep.writeAsString(outputId, minified);

    log.fine('minified ${inputId.path}');
  }


}