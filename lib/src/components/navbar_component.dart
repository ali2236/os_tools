import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:static_aligator_ir/src/components/pages/about_page.dart';
import 'package:static_aligator_ir/src/models/colors.dart';

import '../routing/route_paths.dart';
import 'pages/show_page.dart';

@Component(
  selector: 'nav-bar',
  template: '''
  <div class="ag-navbar">
    <nav class="uk-navbar uk-navbar-container uk-navbar-transparent">
        <div class="uk-navbar-left">
            <a class="uk-navbar-item uk-logo" [routerLink]="RoutePaths.index.toUrl()">
                <h1 class="uk-border-circle text-dark">Ag!</h1>
            </a>
        </div>
        <div class="uk-navbar-right">
         <a class="uk-navbar-item" [routerLink]="RoutePaths.projects.toUrl()" [routerLinkActive]="'active-link'">Projects</a>
            <a class="uk-navbar-item" [routerLink]="RoutePaths.animeList.toUrl()" [routerLinkActive]="'active-link'">Anime</a>
            <a class="uk-navbar-item" [routerLink]="RoutePaths.moviesList.toUrl()" [routerLinkActive]="'active-link'">Movies</a>
            <a class="uk-navbar-item" [routerLink]="RoutePaths.about.toUrl()" [routerLinkActive]="'active-link'">About</a>
        </div>
    </nav>
  </div>
  ''',
  directives: [
    routerDirectives,
    AnimePage,
    MoviePage,
    AboutPage,
  ],
  exports: [RoutePaths],
  styles: ['.active-link{color:${Colors.textLight};}'],
)
class Navbar {}
