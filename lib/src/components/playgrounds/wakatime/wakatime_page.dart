import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/components/page_header.component.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playground_back_button.component.dart';
import 'package:static_aligator_ir/src/components/playgrounds/playground_project.dart';

import '../playground_page.dart';
import '../playgrounds.dart';

@Component(
  selector: 'wakatime-page',
  template: '''
   <div class="container">
      <playground-back-button></playground-back-button>
      <page-header [page]="thisPage"></page-header>
      <div class="my-4">
         <h2 class="ag-text-accent">Programming Languages Used:</h2>
        <figure><embed src="https://wakatime.com/share/@b7bc6984-88ab-4908-bfd9-7c92ed6beab3/96033957-2f5c-46e8-afb4-5569c87ef633.svg"></figure>
         <h2 class="ag-text-accent">Time spent coding:</h2>
        <figure><embed src="https://wakatime.com/share/@b7bc6984-88ab-4908-bfd9-7c92ed6beab3/3e303f12-7c8e-420e-96f7-b0698a467688.svg"></figure>
         <h2 class="ag-text-accent">Editors used:</h2>
        <figure><embed src="https://wakatime.com/share/@b7bc6984-88ab-4908-bfd9-7c92ed6beab3/f6f9a8e9-930d-4a92-bb47-e909555c763e.svg"></figure>
      </div>
   </div>
  ''',
  directives: [PlaygroundBackButton, PageHeader],
)
class WakatimePage extends PlaygroundPage{

  @override
  PlaygroundProject get playground => Playgrounds.wakatime;

}