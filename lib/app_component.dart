import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:firebase/firebase.dart';
import 'package:static_aligator_ir/src/components/footer.component.dart';
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
    <router-outlet [routes]="Routes.all"></router-outlet>
   <!-- <ag-footer></ag-footer>-->
  ''',
  directives: [
    coreDirectives,
    routerDirectives,
    Navbar,
    Footer,
  ],
  providers: [
    ClassProvider(ShowService),
    ClassProvider(ContentService),
    ClassProvider(ProjectService),
  ],
  exports: [Routes, RoutePaths],
)
class AppComponent with OnInit{
  final Router router;

  final Analytics _analytics = analytics();

  AppComponent(this.router);

  @override
  void ngOnInit() {
    router.onRouteActivated.listen((event) {
      if(event!=null){
        _analytics.setCurrentScreen(event.path);
      }
    });
  }

}
