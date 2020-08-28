import 'package:angular/angular.dart';

import '../models/show.dart';

@Component(
  selector: 'show-card',
  template: '''
    <div class="col">
    <div class="mx-2 mb-4">
     <div class="card">
         <img class="card-img anime-poster anime-card-height" src="{{show.imageUrl}}" alt="{{show.id}}_img">
         <div class="card-img-overlay">
             <p class="uk-background-secondary uk-text-small uk-text-warning" style="padding: 4px">{{show.score}}</p>
              <p class="uk-text-small color-white uk-text-top text-background-dark anime-card-width">{{show.name}}</p>
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
