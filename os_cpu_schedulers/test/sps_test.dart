import 'package:os_cpu_schedulers/os_cpu_schedulers.dart';
import 'package:test/test.dart';

void main() {
  group('Static Priority Scheduling', (){
    test('test 1', (){
      expect(
        StaticPriorityScheduling().calculate([
          Process('P1', 10, priority: 3),
          Process('P2', 1, priority: 1),
          Process('P3', 2, priority: 4),
          Process('P4', 1, priority: 5),
          Process('P5', 5, priority: 2),
        ]),
        equals([
          TimeWindow(0, 1, 'P2'),
          TimeWindow(1, 6, 'P5'),
          TimeWindow(6, 16, 'P1'),
          TimeWindow(16, 18, 'P3'),
          TimeWindow(18, 19, 'P4'),
        ]),
      );
    });
  });
}