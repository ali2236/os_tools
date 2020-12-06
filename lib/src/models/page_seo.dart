import 'dart:html';

import 'package:angular/angular.dart';

abstract class PageSEO with OnInit {
  String get pageTitle => null;

  String get pageDescription => null;

  PageSEO get thisPage => this;

  @override
  void ngOnInit() {
    if (pageTitle != null) {
      document.title = pageTitle;
    }
    if (pageDescription != null) {
      document
          .querySelector('meta[name="description"]')
          .setAttribute('content', pageDescription);
    }
  }
}
