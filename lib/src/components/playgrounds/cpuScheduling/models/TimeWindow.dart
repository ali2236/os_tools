class TimeWindow {
  final int start, end;
  final String label;

  TimeWindow(this.start, this.end, this.label);

  @override
  String toString() {
    return '$label($start, $end)';
  }

  @override
  bool operator ==(Object other) {
    if(other is TimeWindow) {
      return start == other.start && end == other.end && label == other.label;
    }
    return false;
  }

  @override
  int get hashCode => start.hashCode ^ end.hashCode ^ label.hashCode;

}