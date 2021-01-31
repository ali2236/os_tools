import 'package:angular/angular.dart';
import 'package:os_memory_allocators/os_memory_allocators.dart';

@Component(
  selector: 'memory-frame',
  template: '''
  <tr>{{frame?.number ?? ''}}</tr>
  ''',
)
class FrameComponent {
  @Input()
  Frame frame;
}