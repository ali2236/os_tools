import 'package:os_cpu_schedulers/os_cpu_schedulers.dart';
import 'package:test/test.dart';

void main() {
  group('Round Robin', (){
    test('test 1', (){
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
    });

    test('test 2', (){
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
  });
}