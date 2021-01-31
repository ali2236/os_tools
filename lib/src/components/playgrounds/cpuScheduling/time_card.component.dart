
import 'package:angular/angular.dart';

@Component(
  selector: 'time-card',
  template: '''
  <div class="card">
    <div class="card-body">
    <p class="card-title text-center text-muted">{{title}}</p>
    <h4 class="text-center">{{value}}</h4>
    </div>
  </div>
  ''',
)
class TimeCard {
  @Input()
  String title;
  @Input()
  num value;
}