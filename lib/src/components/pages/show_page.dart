import 'package:angular/angular.dart';

import '../../models/show.dart';
import '../../services/show_service.dart';
import '../show_card_component.dart';

@Component(
  selector: 'show-page',
  template: '''
  <div class="row" *ngFor="let shows of showsList">
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

  List<List<Show>> showsList = [];

  ShowPage(this._showService);

  @override
  void ngOnInit() async {
    final shows = await _showService.getShowList(showType);
    var rows = (shows.length / 4).ceil();
    for(var i=0;i<rows;i++){
      final sublist = shows.sublist((i*4),(i*4)+4);
      showsList.add(sublist);
    }
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
