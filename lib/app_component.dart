import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:os_aligator_ir/src/components/navbar.component.dart';
import 'package:os_aligator_ir/src/routing/route_paths.dart';
import 'package:os_aligator_ir/src/routing/routes.dart';

@Component(
  selector: 'os-tools',
  template: '''
    <nav-bar></nav-bar>
    <router-outlet [routes]="Routes.all"></router-outlet>
  ''',
  directives: [
    coreDirectives,
    routerDirectives,
    Navbar,
  ],
  exports: [Routes, RoutePaths],
)
class AppComponent{}
