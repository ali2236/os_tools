import 'package:angular/angular.dart';
import 'package:os_memory_allocators/os_memory_allocators.dart';
import 'alocation_snapshot.component.dart';

@Component(
  selector: 'allocation-timeline',
  template: '''
  <div class="row">
    <div class="column" *ngFor="let snapshot of snapshots">
      <allocation-snapshot [snapshot]="snapshot"></allocation-snapshot>
    </div>
  </div>
  ''',
  directives: [
    coreDirectives,
    AllocationSnapshotComponent,
  ],
)
class AllocationTimelineComponent {
  @Input()
  AllocationTimeline timeline;

  List<AllocationSnapshot> get snapshots => timeline.snapshots;
}
