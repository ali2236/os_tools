import 'package:angular/angular.dart';

import '../../models/show.dart';
import '../../services/show_service.dart';
import '../show_card_component.dart';

@Component(
  selector: 'show-page',
  template: '''
  <p>Watched a total of <span [innerText]="hours"></span> hours and <span [innerText]="minutes"></span> minutes of {{showType}}.</p>
  <div class="row" *ngFor="let shows of showsList">
      <show-card class="col-sm-12 col-lg-6" *ngFor="let show of shows" [show]="show"></show-card>
   </div>
  ''',
  directives: [coreDirectives, ShowCard],
)
class ShowPage with OnInit {
  @Input('show-type')
  String showType;

  final ShowService _showService;

  List<List<Show>> showsList = [];

  int hours, minutes;

  ShowPage(this._showService);

  @override
  void ngOnInit() async {
    final shows = await _showService.getShowList(showType);
    var rows = (shows.length / 4).ceil();
    for(var i=0;i<rows;i++){
      final sublist = shows.sublist((i*4),((i*4)+4).clamp(0, shows.length-1));
      showsList.add(sublist);
    }
    calculateWatchTime(shows);
  }

  void calculateWatchTime(List<Show> shows){
    var watchTime = 0;
    for(var show in shows){
      watchTime += show.episodeCount * show.episodeLength;
    }
    hours = (watchTime ~/ 60);
    minutes = (watchTime % 60);
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
