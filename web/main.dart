
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:static_aligator_ir/app_component.template.dart' as ng;

import 'main.template.dart' as self;

@GenerateInjector(routerProvidersHash)
final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}