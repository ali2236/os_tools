import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:static_aligator_ir/src/components/bootstrap_icon.dart';

@Component(
  selector: 'playground-back-button',
  template: r'<p class="ag-text-dark m-0" style="cursor: pointer" (click)="goBack()">Playground</p>',
  directives: [BootstrapIcon]
)
class PlaygroundBackButton {

  final Location location;

  PlaygroundBackButton(this.location);

  void goBack() => location.back();
}