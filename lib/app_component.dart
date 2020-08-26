import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:static_aligator_ir/src/components/navbar_component.dart';
import 'package:static_aligator_ir/src/routing/route_paths.dart';
import 'package:static_aligator_ir/src/routing/routes.dart';
import 'package:static_aligator_ir/src/services/content_service.dart';
import 'package:static_aligator_ir/src/services/project_service.dart';
import 'package:static_aligator_ir/src/services/show_service.dart';

@Component(
  selector: 'aligator',
  template: '''
    <nav-bar></nav-bar>
    <div class="uk-container">
      <router-outlet [routes]="Routes.all"></router-outlet>
    </div>
  ''',
  directives: [
    coreDirectives,
    routerDirectives,
    Navbar,
  ],
  providers: [
    ClassProvider(ShowService),
    ClassProvider(ContentService),
    ClassProvider(ProjectService),
  ],
  exports: [Routes, RoutePaths],
)
class AppComponent {}
