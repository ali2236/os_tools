import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:static_aligator_ir/src/components/pages/about_page.dart';

import '../routing/route_paths.dart';
import 'pages/show_page.dart';

@Component(
  selector: 'nav-bar',
  template: '''
  <div class="ag-navbar">
    <nav class="uk-navbar uk-navbar-container uk-navbar-transparent">
        <div class="uk-navbar-left">
            <a class="uk-navbar-item uk-logo" [routerLink]="RoutePaths.index.toUrl()">
                <img class="uk-border-circle" src="static/upload/icons/aligator.png" alt="Aligator" width="64"
                     height="64">
            </a>
            <a class="uk-navbar-item" [routerLink]="RoutePaths.projects.toUrl()" [routerLinkActive]="'active-route'">Projects</a>
            <a class="uk-navbar-item" [routerLink]="RoutePaths.animeList.toUrl()" [routerLinkActive]="'active-route'">Anime</a>
            <a class="uk-navbar-item" [routerLink]="RoutePaths.moviesList.toUrl()" [routerLinkActive]="'active-route'">Movies</a>
            <a class="uk-navbar-item" [routerLink]="RoutePaths.about.toUrl()" [routerLinkActive]="'active-route'">About</a>
        </div>
    </nav>
  </div>
  ''',
  directives: [routerDirectives, AnimePage, MoviePage, AboutPage],
  exports: [RoutePaths],
  styles: ['.active-route {background-color:teal;}']
)
class Navbar {}
