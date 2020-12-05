import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playground_card.component.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playgrounds.dart';



@Component(
  selector: 'playgrounds-page',
  template: '''
    <div class="container">
        <div class="row">
            <playground-card class="col-4" *ngFor="let playground of Playgrounds.playgrounds" [info]="playground"></playground-card>
        </div>
    </div>
  ''',
  directives: [coreDirectives, PlaygroundCard],
  exports: [Playgrounds]
)
class PlaygroundsPage {

}