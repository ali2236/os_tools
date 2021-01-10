import 'dart:io' hide Process;

import 'package:os_cpu_schedulers/os_cpu_schedulers.dart';

final algoNames = [
  'Shortest Remaining time first/next',
  'Highest Response Ratio Next',
  'Round Robin',
  'Multilevel Feedback Queue',
];

void main() => testFromStdIn();

String get nextLine => stdin.readLineSync();

void testFromStdIn() {
  var i = 1;
  print(
      '### Select cpu scheduling algorithm:\n${algoNames.map((e) => '(${i++}) $e').join('\n')}');
  while (true) {
    stdout.write('algorithm index: ');
    var alg = int.tryParse(nextLine);
    if (alg != null && alg >= 1 && alg <= 4) {
      print('selected algorithm: ${algoNames[alg - 1]}');
      var n = int.tryParse(nextLine);
      final serviceTimes = nextLine.split(',').map(int.tryParse).toList();
      final arrivalTimes = nextLine.split(',').map(int.tryParse).toList();
      final processes = List.generate(
          n,
          (i) => Process('P${i + 1}', serviceTimes[i],
              arrivalTime: arrivalTimes[i]));
      List<TimeWindow> times;
      if (alg == 1) {
        times = ShortestRemainingTime().calculate(processes);
      } else if (alg == 2) {
        times = HighestResponseRatioNext().calculate(processes);
      } else if (alg == 3) {
        var q = int.tryParse(nextLine);
        times = RoundRobin(q).calculate(processes);
      } else if (alg == 4) {
        var q1 = int.tryParse(nextLine);
        var q2 = int.tryParse(nextLine);
        times = MultiLevelFeedbackQueue(q1, q2).calculate(processes);
      }

      if (times != null) {
        print('Gant List:');
        print(times);
        print('');
        print('Average Turnaround time: ${processes.ATT}');
        print('Average Waiting time: ${processes.AWT}');
        print('Average Response time: ${processes.ART}');
        print('');
      }
    } else {
      print('invalid algorithm index, try a number between 1 and 4.');
      sleep(Duration(milliseconds: 300));
    }
  }
}
