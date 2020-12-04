import 'package:static_aligator_ir/src/components/playgrounds/OS/cpuSchedulers/batch/fcfs.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/cpuSchedulers/batch/sjf.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/models/Process.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/models/TimeWindow.dart';
import 'package:test/test.dart';

void main() {
  group('Batch Cpu Scheduler algorithms', () {
    test('First Come First Served', () {
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

    test('Shortest Job First', () {
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

      print(ShortestJobFirst().calculate([
        Process('A', 3, arrivalTime: 0),
        Process('B', 6, arrivalTime: 2),
        Process('C', 4, arrivalTime: 4),
        Process('D', 5, arrivalTime: 6),
        Process('E', 2, arrivalTime: 8),
      ]));

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
