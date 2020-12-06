import 'package:angular/angular.dart';
import 'package:darq/darq.dart';
import 'package:static_aligator_ir/src/components/page_header.component.dart';
import 'package:static_aligator_ir/src/models/page_seo.dart';

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

  Iterable<Iterable<Show>> showsList = [];

  int hours, minutes;

  ShowPage(this._showService);

  @override
  void ngOnInit() async {
    final shows = await _showService.getShowList(showType);
    showsList = shows.segment(4,includeTail: true);
    calculateWatchTime(shows);
  }

  void calculateWatchTime(List<Show> shows) {
    var watchTime = 0;
    for (var show in shows) {
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
  selector: 'anime-page',
  template: '''
  <div class="container">
  <page-header [page]="thisPage"></page-header>
  <show-page show-type="anime"></show-page>
  </div>
  ''',
  directives: [ShowPage, PageHeader],
)
class AnimePage extends PageSEO {
  @override
  String get pageTitle => 'My Anime List';
}

@Component(
  selector: 'movies-page',
  template: '''
  <div class="container">
  <page-header [page]="thisPage"></page-header>
  <show-page show-type="movies"></show-page>
  </div>
  ''',
  directives: [ShowPage, PageHeader],
)
class MoviePage extends PageSEO {
  @override
  String get pageTitle => 'My Movie List';
}
