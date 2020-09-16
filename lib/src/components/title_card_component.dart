import 'package:angular/angular.dart';

@Component(
  selector: 'title-card',
  template: '''
  <div class="card title-card d-flex align-items-center mb-4">
    <div class="p-2 m-auto">{{title}}</div>
  </div>
  ''',
)
class TitleCard {
  @Input()
  String title;
}