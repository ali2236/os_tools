
import 'package:angular/angular.dart';

@Component(
  selector: 'bootstrap-icon',
  template: '''
  <img class="bi" src="{{iconSrc}}" alt="" width="{{size}}" height="{{size}}" title="{{name}}">
  ''',
)
class BootstrapIcon {
  @Input()
  String name;

  @Input()
  double size = 32.0;

  String get iconSrc => '/static/styles/bootstrap-icons-1.0.0/$name.svg';
}
