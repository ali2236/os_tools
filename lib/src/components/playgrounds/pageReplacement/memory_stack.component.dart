import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:os_aligator_ir/src/components/playgrounds/pageReplacement/frame.component.dart';
import 'package:os_aligator_ir/src/models/colors.dart';
import 'package:os_memory_allocators/os_memory_allocators.dart';

@Component(
  selector: 'memory-stack',
  template: '''
  <table class="table">
  <thead>
    <tr>
      <th *ngIf="pointer!=null"><p></p></th>
      <th *ngIf="anyUseBit" scope="col">Use Bit</th>
      <th scope="col">Page in Frame</th>
    </tr>
  </thead>
  <tbody>
  <tr *ngFor="let row of rows">
    <td *ngIf="pointer!=null"><material-icon *ngIf="row==pointer" icon="arrow_right_alt"></material-icon></td>
    <td class="td-border" colspan="1" *ngIf="hasUseBit(getFrame(row))">{{useBitOf(getFrame(row))}}</td>
    <td class="td-border" colspan="2" [ngClass]="cssClassFor(getFrame(row))">{{getFrame(row)?.number ?? '-'}}</td>
  </tr>
  </tbody>
  </table>
  ''',
  directives: [
    coreDirectives,
    FrameComponent,
    MaterialIconComponent,
  ],
  styles: [
    '.td-border {border: 1px solid ${Colors.textDark}; text-align: center;}',
    'th {font-size: 9px; color: ${Colors.textDark};}',
    '.table {margin-bottom: 0px !important;}',
  ],
)
class MemoryStackComponent {
  @Input()
  MemoryStack memoryStack;

  @Input()
  int reference;

  @Input()
  int pointer;

  List<Frame> get frames => memoryStack.frames;

  bool get anyUseBit =>
      frames.map((e) => hasUseBit(e)).reduce((e1, e2) => e1 || e2);

  bool hasUseBit(Frame frame) => frame is CPFrame;

  int useBitOf(Frame frame) => (frame as CPFrame).useBit;

  String cssClassFor(Frame frame) {
    if (frame == null || frame.number == null) return 'ag-text-light';
    return frame.number == reference ? 'ag-text-accent' : 'ag-text-light';
  }
   Frame getFrame(int i){
    return memoryStack.getFrameAt(i);
   }

  Iterable<int> get rows => Iterable.generate(frames.length);
}
