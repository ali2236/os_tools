import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playground_project.dart';
import 'package:static_aligator_ir/src/routing/route_paths.dart';

@Component(
  selector: 'playground-card',
  template: '''
    <div class="card card-body mb-4">
      <div class="card-title"><h5>{{info.name}}</h5></div>
      <div class="card-text">{{info.description}}</div>
      <br/>
      <a class="btn btn-primary stretched-link" [routerLink]="info.path.toUrl()">Open {{info.name}}</a>
    </div>
  ''',
  directives: [routerDirectives, coreDirectives],
  exports: [RoutePaths],
)
class PlaygroundCard {

  @Input()
  PlaygroundProject info;
}
