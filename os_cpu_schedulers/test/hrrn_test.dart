import 'package:os_cpu_schedulers/os_cpu_schedulers.dart';
import 'package:test/test.dart';

void main() {
  group('Highest Response Ratio Next', (){
    test('test 1', (){
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
  });
}