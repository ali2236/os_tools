import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:os_aligator_ir/src/components/page_header.component.dart';
import 'package:os_aligator_ir/src/components/playgrounds/playground_back_button.component.dart';
import 'package:os_aligator_ir/src/components/playgrounds/playground_project.dart';
import 'package:os_aligator_ir/src/components/playgrounds/playgrounds.dart';
import 'package:os_cpu_schedulers/os_cpu_schedulers.dart';

import '../playground_page.dart';
import 'average_memory_time.component.dart';
import 'cpu_utilization.component.dart';
import 'scheduler_form.component.dart';

@Component(
  selector: 'cpu-scheduling-page',
  template: '''
  <div class="container">
      <playground-back-button></playground-back-button>
      <page-header [page]="thisPage"></page-header>
      <h3>Cpu Scheduling Algorithms</h3>
      <div class="my-4">
        <h4 class="ag-text-accent">Shortest Job First</h4>
        <scheduler-form name="SJF" [parser]="atParser" [placeholder]="example1" [scheduler]="sjf"></scheduler-form>
        <h4 class="ag-text-accent">Shortest Remaining Time/Preemptive SJF</h4>
        <scheduler-form name="SRT" [parser]="atParser" [placeholder]="example2" [scheduler]="srt"></scheduler-form>
        <h4 class="ag-text-accent">Highest Response Ratio Next</h4>
        <scheduler-form name="HRRN" [parser]="atParser" [placeholder]="example2" [scheduler]="hrrn"></scheduler-form>
        <h4 class="ag-text-accent">Round Robin</h4>
        <div class="form-group">
          <label for="rrq-input">Quantum:</label>
          <input id="rrq-input" #rrq class="form-control" type="number" value="1" (keyup)="updateRoundRobin(rrq.value)">
          <scheduler-form name="RR" [parser]="atParser" [placeholder]="example2" [scheduler]="rr"></scheduler-form>
        </div>
        <h4 class="ag-text-accent">Static Priority Scheduling</h4>
        <scheduler-form name="SPS" [parser]="prParser" [placeholder]="example3" [scheduler]="sps"></scheduler-form>
        <h4 class="ag-text-accent">MultiLevel Feedback Queue</h4>
        <div class="form-group">
          <label for="rr1q-input">Quantums(Format: {{'<Quantum1> <Quantum2>'}}):</label>
          <input id="rr1q-input" #rr1q class="form-control" placeholder="1 2" (keyup)="updateMFQ(rr1q.value)">
          <scheduler-form name="MFQ" [parser]="atParser" [placeholder]="example2" [scheduler]="mfq"></scheduler-form>
        </div>
      </div>
    </div>
  ''',
  directives: [
    coreDirectives,
    formDirectives,
    SchedulerForm,
    AverageMemoryTimeCalculator,
    CpuUtilization,
    PageHeader,
    PlaygroundBackButton,
  ],
)
class CpuSchedulingPage extends PlaygroundPage{
  final atParser = ArrivalTimeParser();
  final prParser = PriorityProcessParser();
  final example1 = 'P1 24\nP2 3\nP3 3';
  final example2 = 'A 3 0\nB 6 2\nC 4 4\nD 5 6\nE 2 8';
  final example3 = 'P1 10 3\nP2 1 1\nP3 2 4\nP4 1 5\nP5 5 2';
  final sjf = ShortestJobFirst();
  final fcfs = FirstComeFirstServed();
  final srt = ShortestRemainingTime();
  final hrrn = HighestResponseRatioNext();
  var rr = RoundRobin(1);
  final sps = StaticPriorityScheduling();
  var mfq = MultiLevelFeedbackQueue(1, 2);

  void updateRoundRobin(q) => rr = RoundRobin(int.tryParse(q));

  void updateMFQ(q) {
    try {
      final qs = (q as String).split(' ').map(int.tryParse).toList();
      mfq = MultiLevelFeedbackQueue(qs[0], qs[1]);
    } catch(e){}
  }

  @override
  PlaygroundProject get playground => Playgrounds.cpu_scheduling;
}
