
import 'dart:html';

import 'package:http/http.dart';

void main() {

  for(var partial in querySelectorAll('mustache')){

    var src = partial.attributes['src'];
    get(src).then((value) {
      return partial.innerHtml = value.body;
    });
  }

}