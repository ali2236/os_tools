import 'package:angular/angular.dart';
import 'package:darq/darq.dart';
import 'package:os_aligator_ir/src/components/page_header.component.dart';
import 'package:os_aligator_ir/src/components/playgrounds/playground_card.component.dart';
import 'package:os_aligator_ir/src/components/playgrounds/playgrounds.dart';
import 'package:os_aligator_ir/src/models/page_seo.dart';

import 'playground_project.dart';

@Component(
  selector: 'playgrounds-page',
  template: '''
    <div class="container">
        <page-header [page]="thisPage"></page-header>
        <div class="row" *ngFor="let prow of playgroundRows">
            <div class="col-lg-4 col-sm-12 col-md-6" *ngFor="let playground of prow">
            <playground-card class="m-2" [info]="playground"></playground-card>
            </div>
        </div>
    </div>
  ''',
  directives: [
    coreDirectives,
    PlaygroundCard,
    PageHeader,
  ],
  exports: [Playgrounds],
)
class PlaygroundsPage extends PageSEO {
  Iterable<Iterable<PlaygroundProject>> get playgroundRows =>
      Playgrounds.playgrounds.segment(3, includeTail: true);

  @override
  String get pageTitle => 'Playgrounds';

  @override
  String get pageDescription => 'A place where I do coding experiments!';
}
