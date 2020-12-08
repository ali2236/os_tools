import 'package:angular/angular.dart';

@Component(
  selector: 'title-card',
  template: '''
  <div class="card title-card d-flex align-items-center mb-4">
    <div #box class="p-2 m-auto"
    (mouseenter)="box.innerText = hover ?? title" 
    (mouseleave)="box.innerText = title">{{title}}</div>
  </div>
  ''',
  directives: [],
)
class TitleCard {
  @Input()
  String title;

  @Input()
  String hover;
}