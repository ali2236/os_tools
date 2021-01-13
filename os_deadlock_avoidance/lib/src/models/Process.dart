class Process {
  final String label;
  final List<int> max;
  final List<int> allocated;

  Process(this.label, this.max, this.allocated);

  List<int> get need => List.generate(max.length, (i) => max[i] - allocated[i]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Process &&
          runtimeType == other.runtimeType &&
          label == other.label;

  @override
  int get hashCode => label.hashCode;
}