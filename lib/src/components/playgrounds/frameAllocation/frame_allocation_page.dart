import 'package:angular/angular.dart';
import 'package:os_aligator_ir/src/components/playgrounds/playground_page.dart';
import 'package:os_aligator_ir/src/components/playgrounds/playground_project.dart';
import 'package:os_aligator_ir/src/components/playgrounds/playgrounds.dart';

@Component(
  selector: 'frame-allocation-page',
  template: '''
  <playground-back-button></playground-back-button>
      <page-header [page]="thisPage"></page-header>
      <h3>Memory Frame Allocation Algorithms</h3>
      <div class="my-4">
        <div class="form-group">
        <label for="processTextArea">{{format}}</label>
        <textarea class="form-control" id="processTextArea" rows="5" [placeholder]="placeholder" [(ngModel)]="inputText"></textarea>
        <button class="btn btn-primary mt-2" (click)="calculate()">Calculate</button>
  </div>
      </div>
  ''',
)
class FrameAllocationPage extends PlaygroundPage {

  @override
  PlaygroundProject get playground => Playgrounds.frame_allocation;

  void calculate(){

  }

}