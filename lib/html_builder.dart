import 'dart:async';

import 'package:build/build.dart';

class HtmlBuilder extends Builder{

  @override
  Map<String, List<String>> get buildExtensions => {
    //'.html' : ['.html'],
  };

  @override
  FutureOr<void> build(BuildStep buildStep) {
    // TODO: implement build
    return null;
  }

}