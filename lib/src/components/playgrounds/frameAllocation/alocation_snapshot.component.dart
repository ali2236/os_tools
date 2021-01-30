import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:os_aligator_ir/src/components/playgrounds/frameAllocation/memory_stack.component.dart';
import 'package:os_memory_allocators/os_memory_allocators.dart';

@Component(
  selector: 'allocation-snapshot',
  template: '''<div class="px-3">
                <memory-stack [memoryStack]="mStack" [reference]="reference" [pointer]="pointer"></memory-stack>
                <p class="ag-text-accent small" *ngIf="pageFault">Page Fault!</p>
</div>
  ''',
  directives: [
    coreDirectives,
    MemoryStackComponent,
    MaterialIconComponent,
  ],
  styles: [
    '.small{font-size:12px;text-align:right;}',
    '.nbm{bottom-margin: 0px !important;}'
  ],
)
class AllocationSnapshotComponent {
  @Input()
  AllocationSnapshot snapshot;

  MemoryStack get mStack => snapshot.memory;

  bool get pageFault => snapshot.pageFault;

  int get reference => snapshot.reference;

  int get pointer => snapshot.pointer;
}
