
import 'package:static_aligator_ir/src/components/playgrounds/OS/cpuSchedulers/fcfs.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/cpuSchedulers/hrrn.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/cpuSchedulers/rr.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/cpuSchedulers/sjf.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/cpuSchedulers/sps.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/cpuSchedulers/srt.dart';
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

    test('Shortest Remaining Time', () {
      expect(
        ShortestRemainingTime().calculate([
          Process('A', 3, arrivalTime: 0),
          Process('B', 6, arrivalTime: 2),
          Process('C', 4, arrivalTime: 4),
          Process('D', 5, arrivalTime: 6),
          Process('E', 2, arrivalTime: 8),
        ]),
        equals([
          TimeWindow(0, 3, 'A'),
          TimeWindow(3, 4, 'B'),
          TimeWindow(4, 8, 'C'),
          TimeWindow(8, 10, 'E'),
          TimeWindow(10, 15, 'B'),
          TimeWindow(15, 20, 'D'),
        ]),
      );
    });

    test('Highest Response Ratio Next', () {
      expect(
        HighestResponseRatioNext().calculate([
          Process('A', 3, arrivalTime: 0),
          Process('B', 6, arrivalTime: 2),
          Process('C', 4, arrivalTime: 4),
          Process('D', 5, arrivalTime: 6),
          Process('E', 2, arrivalTime: 8),
        ]),
        equals([
          TimeWindow(0, 3, 'A'),
          TimeWindow(3, 9, 'B'),
          TimeWindow(9, 13, 'C'),
          TimeWindow(13, 15, 'E'),
          TimeWindow(15, 20, 'D'),
        ]),
      );
    });

    test('Round Robin', () {
      expect(
        RoundRobin(4).calculate([
          Process('P1', 24),
          Process('P2', 3),
          Process('P3', 3),
        ]),
        equals([
          TimeWindow(0, 4, 'P1'),
          TimeWindow(4, 7, 'P2'),
          TimeWindow(7, 10, 'P3'),
          TimeWindow(10, 14, 'P1'),
          TimeWindow(14, 18, 'P1'),
          TimeWindow(18, 22, 'P1'),
          TimeWindow(22, 26, 'P1'),
          TimeWindow(26, 30, 'P1'),
        ]),
      );

      expect(
        RoundRobin(1).calculate([
          Process('A', 3, arrivalTime: 0),
          Process('B', 6, arrivalTime: 2),
          Process('C', 4, arrivalTime: 4),
          Process('D', 5, arrivalTime: 6),
          Process('E', 2, arrivalTime: 8),
        ]),
        equals([
          TimeWindow(0, 1, 'A'),
          TimeWindow(1, 2, 'A'),
          TimeWindow(2, 3, 'B'),
          TimeWindow(3, 4, 'A'),
          TimeWindow(4, 5, 'B'),
          TimeWindow(5, 6, 'C'),
          TimeWindow(6, 7, 'B'),
          TimeWindow(7, 8, 'D'),
          TimeWindow(8, 9, 'C'),
          TimeWindow(9, 10, 'B'),
          TimeWindow(10, 11, 'E'),
          TimeWindow(11, 12, 'D'),
          TimeWindow(12, 13, 'C'),
          TimeWindow(13, 14, 'B'),
          TimeWindow(14, 15, 'E'),
          TimeWindow(15, 16, 'D'),
          TimeWindow(16, 17, 'C'),
          TimeWindow(17, 18, 'B'),
          TimeWindow(18, 19, 'D'),
          TimeWindow(19, 20, 'D'),
        ]),
      );
    });

    test('Static Priority Scheduling', () {
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
