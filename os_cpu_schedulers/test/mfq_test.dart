import 'package:os_cpu_schedulers/os_cpu_schedulers.dart';
import 'package:test/test.dart';

void main() {
  group('MultiLevel Feedback Queue', (){
    test('test 1', (){
      expect(
        MultiLevelFeedbackQueue(1,2).calculate([
          Process('A', 3, arrivalTime: 0),
          Process('B', 6, arrivalTime: 2),
          Process('C', 4, arrivalTime: 4),
          Process('D', 5, arrivalTime: 6),
          Process('E', 2, arrivalTime: 8),
        ]),
        equals([
          TimeWindow(0, 1, 'A'),
          TimeWindow(1, 3, 'A'),
          TimeWindow(3, 4, 'B'),
          TimeWindow(4, 5, 'C'),
          TimeWindow(5, 7, 'B'),
          TimeWindow(7, 8, 'D'),
          TimeWindow(8, 9, 'E'),
          TimeWindow(9, 11, 'C'),
          TimeWindow(11, 13, 'D'),
          TimeWindow(13, 14, 'E'),
          TimeWindow(14, 17, 'B'),
          TimeWindow(17, 18, 'C'),
          TimeWindow(18, 20, 'D'),
        ]),
      );
    });
  });
}