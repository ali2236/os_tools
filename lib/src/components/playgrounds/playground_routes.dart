import 'package:angular_router/angular_router.dart';

import '../playgrounds/OS/OS_page.template.dart' as os;
import 'playgrounds.dart';

class PlaygroundRoutes {
  static final routes = [
    RouteDefinition(
      routePath: Playgrounds.os.path,
      component: os.NgOsPageFactory,
    ),
  ];
}