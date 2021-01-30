import 'package:angular/angular.dart';
import 'package:os_aligator_ir/src/components/playgrounds/frameAllocation/alocation_snapshot.component.dart';
import 'package:os_memory_allocators/os_memory_allocators.dart';

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
