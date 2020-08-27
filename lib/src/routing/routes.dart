import 'package:angular_router/angular_router.dart';

import '../components/pages/about_page.template.dart' as about;
import '../components/pages/index_page.template.dart' as index;
import '../components/pages/projects_page.template.dart' as projects;
import '../components/pages/show_page.template.dart' as showPage;
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
      routePath: RoutePaths.about,
      component: about.AboutPageNgFactory,
    ),
    RouteDefinition.redirect(
      path: '.*',
      redirectTo: '/',
    ),
  ];
}
