import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playground_project.dart';
import 'package:static_aligator_ir/src/routing/route_paths.dart';

@Component(
  selector: 'playground-card',
  template: '''<div class="card card-body">
    <div class="card-title ag-text-accent"><h5>{{info.name}}</h5></div>
    <div class="card-text">
        <p>{{info.description}}</p>
        <p>Tags: <span
                class="badge mr-1 badge-secondary"
                *ngFor="let tag of info.tags">{{tag}}</span></p>
    </div>
    <a class="btn btn-primary" [routerLink]="info.path.toUrl()">Open {{info.name}}</a>
</div>
  ''',
  directives: [routerDirectives, coreDirectives],
  exports: [RoutePaths],
)
class PlaygroundCard {
  @Input()
  PlaygroundProject info;
}