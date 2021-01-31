import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:os_aligator_ir/src/components/page_header.component.dart';
import 'package:os_aligator_ir/src/components/playgrounds/pageReplacement/allocation_timeline.component.dart';
import 'package:os_aligator_ir/src/components/playgrounds/playground_back_button.component.dart';
import 'package:os_aligator_ir/src/components/playgrounds/playground_page.dart';
import 'package:os_aligator_ir/src/components/playgrounds/playground_project.dart';
import 'package:os_aligator_ir/src/components/playgrounds/playgrounds.dart';
import 'package:os_memory_allocators/os_memory_allocators.dart';

@Component(selector: 'frame-allocation-page', template: '''
  <div class="container">
  <playground-back-button></playground-back-button>
      <page-header [page]="thisPage"></page-header>
      <div class="my-4">
        <div class="form-group">
        <label for="frameTextArea">Memory Frame Count:</label>
        <input type="number" min="1" class="form-control" id="frameTextArea" rows="1" [(ngModel)]="frameCount">
      </div>
      <div class="my-4">
        <div class="form-group">
        <label for="pageTextArea">Referenced Pages List: {{pageFormat}}</label>
        <textarea class="form-control" id="pageTextArea" rows="1" [placeholder]="pagePlaceholder" [(ngModel)]="pageInput"></textarea>
      </div>
        <button class="btn btn-primary mt-2" (click)="calculate()">Calculate</button>
      </div>
      <div *ngIf="result!=null">
      <material-tab-panel class="tab-panel">
        <material-tab *ngFor="let alg of names" [label]="tabTitle(alg)">
            <allocation-timeline [timeline]="result[alg]"></allocation-timeline>
        </material-tab>
      </material-tab-panel>
      </div>
      </div>
      </div>
  ''', directives: [
  PageHeader,
  PlaygroundBackButton,
  formDirectives,
  coreDirectives,
  MaterialTabComponent,
  MaterialTabPanelComponent,
  AllocationTimelineComponent,
], styleUrls: [
  '../tabs.css'
])
class FrameAllocationPage extends PlaygroundPage {
  String pageFormat = '(space separated integers)';
  String pagePlaceholder = '2 3 2 1 5 2 4 5 3 2 5 2';
  String pageInput;
  int frameCount = 3;
  Map<String, AllocationTimeline> result;

  List<int> parseInput() {
    return (pageInput ?? pagePlaceholder).split(' ').map(int.tryParse).where((e) => e!=null).toList();
  }

  @override
  PlaygroundProject get playground => Playgrounds.page_replacement;

  final names = [
    'Optimal Policy',
    'Least Recently Used',
    'First In First Out',
    'Clock Policy',
  ];

  final algorithms = <MemoryAllocator>[
    OptimalPolicyAllocator(),
    LeastRecentlyUsed(),
    FirstInFirstOut(),
    ClockPolicy()
  ];

  String tabTitle(String algorithmName) =>
      '$algorithmName(${result[algorithmName].pageFaults})';

  void calculate() async{
    if(result!=null){
      result=null;
      await Future.delayed(Duration(milliseconds: 1));
    }
    try {
      var input = parseInput();
      var timelines =
          algorithms.map((e) => e.calculate(input, frameCount)).toList();
      result = Map.fromIterables(names, timelines);
    } catch (e) {
      result = null;
    }
  }



  @override
  void ngOnInit() {
    super.ngOnInit();
    calculate();
  }
}
