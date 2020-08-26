import 'package:angular/angular.dart';

import '../../models/show.dart';
import '../../services/show_service.dart';
import '../show_card_component.dart';

@Component(
  selector: 'show-page',
  template: '''
  <div class="row">
    <div *ngFor="let show of shows">
      <show-card [show]="show"></show-card>
    </div>
   </div>
  ''',
  directives: [coreDirectives, ShowCard],
)
class ShowPage with OnInit {
  @Input('show-type')
  String showType;

  final ShowService _showService;

  List<Show> shows = [];

  ShowPage(this._showService);

  @override
  void ngOnInit() async {
    shows = await _showService.getShowList(showType);
  }
}

/*
* <p>Watched a total of <span id="watchtime-hours"></span> hours and <span id="watchtime-minutes"></span>
    minutes of movies.</p>
<p class="uk-text-small uk-text-muted">last updated {{ date }}</p>*/

@Component(
    template: '''
  <div class="container">
  <h1>My Anime List</h1>
  <show-page show-type="anime"></show-page>
  </div>
  ''',
    selector: 'anime-page',
    directives: [ShowPage])
class AnimePage {}

@Component(
    template: '''
  <div class="container">
  <h1>My Movie List</h1>
  <show-page show-type="movies"></show-page>
  </div>
  ''',
    selector: 'movies-page',
    directives: [ShowPage])
class MoviePage {}
