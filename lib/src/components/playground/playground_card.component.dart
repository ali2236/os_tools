import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:static_aligator_ir/src/components/playground/playground_project.dart';
import 'package:static_aligator_ir/src/routing/route_paths.dart';

@Component(
  selector: 'playground-card',
  template: '''
    <div class="card card-body mb-4">
      <div class="card-title">{{info.name}}</div>
      <div class="card-text">{{info.description}}</div>
      <a class="btn btn-primary stretched-link" [routerLink]="lnk">Open {{info.name}}</a>
    </div>
  ''',
  directives: [routerDirectives, coreDirectives],
  exports: [RoutePaths],
)
class PlaygroundCard {
  final Router router;

  @Input()
  PlaygroundProject info;

  PlaygroundCard(this.router);

  String get lnk => '${RoutePaths.playgrounds.toUrl()}?active=${info.id}';

  void navigate() async {
    await router.navigate(
      '/playgrounds',
      NavigationParams(
        queryParameters: {'active': info.id},
      ),
    );
  }
}
