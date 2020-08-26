import 'package:angular/angular.dart';

import '../models/show.dart';

@Component(
  selector: 'show-card',
  template: '''
     <div class="uk-card uk-card-default uk-card-body uk-inline uk-padding-remove anime-card-width uk-animation-fade">
         <img class="anime-poster anime-card-height" src="{{show.imageUrl}}" alt="{{show.id}}_img">
         <div class="uk-overlay uk-position-top-right uk-padding-remove">
             <p class="uk-background-secondary uk-text-small uk-text-warning" style="padding: 4px">{{show.score}}</p>
         </div>
         <div class="uk-overlay uk-position-bottom uk-padding-remove">
             <p class="uk-text-small color-white uk-text-top text-background-dark anime-card-width">{{show.name}}</p>
         </div>
     </div>
  ''',
)
class ShowCard {
  @Input()
  Show show;
}
