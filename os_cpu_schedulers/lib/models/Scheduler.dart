import 'Process.dart';
import 'TimeWindow.dart';

abstract class CpuScheduler {
  List<TimeWindow> calculate(List<Process> processes);
}