import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/components/bootstrap_icon.dart';

import '../models/show.dart';

@Component(
  selector: 'show-card',
  template: '''
    <div class="mb-4">
     <div class="card">
        <div class="row">
          <div class="col">
            <img class="anime-poster anime-card-height" src="{{show.imageUrl}}" alt="{{show.id}}_img">
          </div>
          <div class="col">
            <p><span>
            <bootstrap-icon [name]="starIcon" [size]="16"></bootstrap-icon>
            </span> {{show.score}} / 10</p>
            <p class="color-white anime-card-width">{{show.name}}</p>
            <br/>
            <p>Episodes: {{show.episodeCount}}</p>
            <p>Episode length: {{show.episodeLength}}</p>
          </div>
        </div>
     </div>
    </div>
  ''',
  directives: [BootstrapIcon],
)
class ShowCard {
  @Input()
  Show show;

  String starIcon = 'star-fill';
}
