import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:static_aligator_ir/src/components/pages/about_page.dart';

import '../routing/route_paths.dart';
import 'pages/show_page.dart';

@Component(
  selector: 'nav-bar',
  template: '''
   <nav class="navbar navbar-expand-lg navbar-dark bg-transparent">
       <a class="navbar-brand" [routerLink]="RoutePaths.index.toUrl()">
           <h1 class="ag-text-dark">Ag!</h1>
       </a>
       <div class="mr-auto"></div>
       <ul class="navbar-nav">
           <li class="nav-item"><a class="nav-link ag-text-accent" [routerLink]="RoutePaths.projects.toUrl()" [routerLinkActive]="'active'">Projects</a></li>
           <li class="nav-item"><a class="nav-link" [routerLink]="RoutePaths.animeList.toUrl()" [routerLinkActive]="'active'">Anime</a></li>
           <li class="nav-item"><a class="nav-link" [routerLink]="RoutePaths.moviesList.toUrl()" [routerLinkActive]="'active'">Movies</a></li>
           <li class="nav-item"><a class="nav-link" [routerLink]="RoutePaths.about.toUrl()" [routerLinkActive]="'active'">About</a></li>
       </ul>
   </nav>
  ''',
  directives: [
    routerDirectives,
    AnimePage,
    MoviePage,
    AboutPage,
  ],
  exports: [RoutePaths],
)
class Navbar {}
