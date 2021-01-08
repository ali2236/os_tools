import 'package:angular_router/angular_router.dart';
import 'package:os_aligator_ir/src/components/playgrounds/playground_routes.dart';
import '../components/playgrounds/playgrounds_page.template.dart' as playgrounds;
import 'route_paths.dart';

class Routes {
  static final all = <RouteDefinition>[
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.playgrounds.toUrl(),
    ),
    ...PlaygroundRoutes.routes,
    RouteDefinition.redirect(
      path: '.*',
      redirectTo: '/',
    ),
  ];
}
