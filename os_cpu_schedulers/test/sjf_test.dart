import 'package:os_cpu_schedulers/os_cpu_schedulers.dart';
import 'package:test/test.dart';

void main() {
  group('Shortest Job First', () {
    test('test 1', () {
      expect(
        ShortestJobFirst().calculate([
          Process('P1', 24),
          Process('P2', 3),
          Process('P3', 3),
        ]),
        equals([
          TimeWindow(0, 3, 'P2'),
          TimeWindow(3, 6, 'P3'),
          TimeWindow(6, 30, 'P1'),
        ]),
      );
    });
    test('test 2', () {
      expect(
        ShortestJobFirst().calculate([
          Process('A', 3, arrivalTime: 0),
          Process('B', 6, arrivalTime: 2),
          Process('C', 4, arrivalTime: 4),
          Process('D', 5, arrivalTime: 6),
          Process('E', 2, arrivalTime: 8),
        ]),
        equals([
          TimeWindow(0, 3, 'A'),
          TimeWindow(3, 9, 'B'),
          TimeWindow(9, 11, 'E'),
          TimeWindow(11, 15, 'C'),
          TimeWindow(15, 20, 'D'),
        ]),
      );
    });
  });
}
