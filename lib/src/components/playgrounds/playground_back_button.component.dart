import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'playground-back-button',
  template: r'<p class="ag-text-dark m-0" style="cursor: pointer" (click)="goBack()">Tools</p>',
)
class PlaygroundBackButton {

  final Location location;

  PlaygroundBackButton(this.location);

  void goBack() => location.back();
}