import 'TimeWindow.dart';

class Process {
  final String label;
  final int arrivalTime;
  final int serviceTime;

  Process(this.label, this.serviceTime, {this.arrivalTime = 0}) {
    _remainingTime = serviceTime;
  }

  factory Process.fromString(String s) {
    var parts = s.split(' ');
    return Process(parts[0], int.tryParse(parts[1]),
        arrivalTime: parts.length == 3 ? int.tryParse(parts[2]) : 0);
  }

  final _frames = <TimeWindow>[];

  int _remainingTime;

  int get remainingTime => _remainingTime;

  int _start;

  void start(int time) {
    _start = time;
  }

  TimeWindow stop(int time) {
    var frame = TimeWindow(_start, time, label);
    _frames.add(frame);
    _remainingTime -= time - _start;
    _start = null;
  }

  TimeWindow runNonPreemptive(int startTime) {
    var frame = TimeWindow(startTime, startTime + remainingTime, label);
    _frames.add(frame);
    return frame;
  }

  //////////////////////////////

  int get turnaroundTime => _frames.last.end - arrivalTime;

  int get responseTime => _frames.first.start - arrivalTime;

  int get waitingTime => turnaroundTime - serviceTime;

  /////////////////////////////

  @override
  String toString() {
    return '$label($arrivalTime,$serviceTime)';
  }
}
