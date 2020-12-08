import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/components/page_header.component.dart';

import '../playground_page.dart';
import '../playground_project.dart';
import '../playgrounds.dart';
import 'data/persona.dart' deferred as persona;

@Component(
  selector: 'persona-page',
  template: '''
  <div class="container">
    <page-header [page]="thisPage"></page-header>
    <div class="my-4">
      <table class="table table-striped">
        <thead>
          <tr class="ag-text-accent">
            <td scope="col">Name</td>
            <td scope="col">Birth year</td>
            <td scope="col">Death year</td>
            <td scope="col">About</td>
            <td scope="col">Name origin</td>
            <td scope="col">Likes</td>
            <td scope="col">Dislikes</td>
          </tr>
        </thead>
        <tbody *ngIf="personas!=null">
          <tr *ngFor="let persona of personas"> 
            <td *ngFor="let data of persona">{{data}}</td>
          </tr>
        </tbody>
        <div *ngIf="personas==null">Loading...</div>
      </table>
    </div>
  </div>
  ''',
  directives: [coreDirectives, PageHeader],
)
class PersonaPage extends PlaygroundPage {
  List<List<String>> personas;

  @override
  void ngOnInit() async {
    super.ngOnInit();
    await persona.loadLibrary();
    personas = persona.personas.map((e) => e.toList()).toList();
  }

  @override
  PlaygroundProject get playground => Playgrounds.personas;
}
