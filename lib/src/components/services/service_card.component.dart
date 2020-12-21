import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/components/services/service.dart';

@Component(
  selector: 'service-card',
  template: '''
  <div class="card card-body" (click)="open()">
    <div class="card-title ag-text-accent"><h5>{{service.name}}</h5></div>
    <div class="card-text">
        <p>{{service.description}}</p>
    </div>
   </div>
  ''',
)
class ServiceCard {

  @Input()
  Service service;

  void open(){
    //service.path.toUrl()
  }
}