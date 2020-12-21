import 'package:angular_router/angular_router.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playground_routes.dart';

import '../components/pages/about_page.template.dart' as about;
import '../components/pages/index_page.template.dart' as index;
import '../components/pages/powerpoints_page.template.dart' as powerpointPage;
import '../components/pages/projects_page.template.dart' as projects;
import '../components/pages/show_page.template.dart' as showPage;
import '../components/playgrounds/playgrounds_page.template.dart' deferred as playgrounds;
import '../components/services/services_page.template.dart' deferred as services;
import 'route_paths.dart';

class Routes {
  static final all = <RouteDefinition>[
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.index.toUrl(),
    ),
    RouteDefinition(
      routePath: RoutePaths.index,
      component: index.IndexPageNgFactory,
    ),
    RouteDefinition(
      routePath: RoutePaths.animeList,
      component: showPage.AnimePageNgFactory,
    ),
    RouteDefinition(
      routePath: RoutePaths.moviesList,
      component: showPage.MoviePageNgFactory,
    ),
    RouteDefinition(
      routePath: RoutePaths.projects,
      component: projects.ProjectsPageNgFactory,
    ),
    RouteDefinition(
      routePath: RoutePaths.powerPoints,
      component: powerpointPage.PowerPointsPageNgFactory,
    ),
    RouteDefinition.defer(
      routePath: RoutePaths.playgrounds,
      loader: () async {
        await playgrounds.loadLibrary();
        return playgrounds.PlaygroundsPageNgFactory;
      },
    ),
    ...PlaygroundRoutes.routes,
    RouteDefinition.defer(
      routePath: RoutePaths.services,
      loader: () async {
        await services.loadLibrary();
        return services.ServicesPageNgFactory;
      },
    ),
    RouteDefinition(
      routePath: RoutePaths.about,
      component: about.AboutPageNgFactory,
    ),
    RouteDefinition.redirect(
      path: '.*',
      redirectTo: '/',
    ),
  ];
}
