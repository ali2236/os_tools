import 'TimeWindow.dart';

class Process {
  final String label;
  final int arrivalTime;
  final int serviceTime;
  int priority;

  Process(this.label, this.serviceTime,
      {this.arrivalTime = 0, this.priority = 1}) {
    _remainingTime = serviceTime;
  }

  factory Process.fromString(String s) {
    var parts = s.split(' ');
    return Process(parts[0], int.tryParse(parts[1]),
        arrivalTime: parts.length == 3 ? int.tryParse(parts[2]) : 0);
  }

  factory Process.fromStringWithPriority(String s) {
    var parts = s.split(' ');
    return Process(
      parts[0],
      int.tryParse(parts[1]),
      priority: int.tryParse(parts[2]),
      arrivalTime: parts.length == 4 ? int.tryParse(parts[3]) : 0,
    );
  }

  final _frames = <TimeWindow>[];

  int _remainingTime;

  int get remainingTime => _remainingTime;

  int _start;

  bool get started => _start != null;

  void start(int time) {
    _start = time;
  }

  void advance(int i) {
    _remainingTime -= i;
  }

  TimeWindow stop(int time) {
    var frame = TimeWindow(_start, time, label);
    _frames.add(frame);
    _start = null;
    return frame;
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
