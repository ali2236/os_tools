import 'package:os_cpu_schedulers/os_cpu_schedulers.dart';
import 'package:test/test.dart';

void main() {
  group('First Come First Served', () {
    test('test 1', () {
      expect(
        FirstComeFirstServed().calculate([
          Process('P1', 24),
          Process('P2', 3),
          Process('P3', 3),
        ]),
        equals([
          TimeWindow(0, 24, 'P1'),
          TimeWindow(24, 27, 'P2'),
          TimeWindow(27, 30, 'P3'),
        ]),
      );
    });
  });
}
