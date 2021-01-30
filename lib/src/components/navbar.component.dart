import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../routing/route_paths.dart';

@Component(
  selector: 'nav-bar',
  template: '''
   <nav class="navbar navbar-expand-lg navbar-dark bg-transparent mx-4">
       <a class="navbar-brand" [routerLink]="RoutePaths.playgrounds.toUrl()"><h1>OS!</h1></a>
       <div id="collapseNavbar" class="collapse navbar-collapse">       
       <ul class="navbar-nav ml-auto">
           <li class="nav-item"><a class="nav-link" [routerLink]="RoutePaths.playgrounds.toUrl()" [routerLinkActive]="'active'">Tools</a></li>
       </ul>
       </div>
       <button class="navbar-toggler ml-auto" type="button" data-toggle="collapse" data-target="#collapseNavbar" aria-controls="collapseNavbar" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
       </button>
   </nav>
  ''',
  directives: [routerDirectives],
  exports: [RoutePaths],
)
class Navbar {}
