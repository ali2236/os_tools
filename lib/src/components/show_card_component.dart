import 'package:angular/angular.dart';

import '../models/show.dart';

@Component(
  selector: 'show-card',
  template: '''
    <div class="col-sm-12 col-md-6">
     <div class="card">
        <div class="row">
          <div class="col">
            <img class="anime-poster anime-card-height" src="{{show.imageUrl}}" alt="{{show.id}}_img">
          </div>
          <div class="col">
            <p>{{show.score}}</p>
            <p class="color-white anime-card-width">{{show.name}}</p>
          </div>
        </div>
     </div>
    </div>
  ''',
)
class ShowCard {
  @Input()
  Show show;
}
