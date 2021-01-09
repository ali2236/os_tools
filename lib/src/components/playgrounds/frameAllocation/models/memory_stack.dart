import 'dart:collection';
import 'package:os_aligator_ir/src/components/playgrounds/frameAllocation/models/frame.dart';
import 'package:darq/darq.dart';

class MemoryStack {
  final List<Frame> _frames;

  const MemoryStack._(this._frames);

  factory MemoryStack.fromFrames(List<Frame> frames) {
    return MemoryStack._(frames);
  }

  factory MemoryStack.empty(int n) {
    return MemoryStack.fromFrames(List.generate(n, (i) => Frame(null)));
  }

  int get emptySlots => _frames.where((f) => f.number == null).length;

  UnmodifiableListView<Frame> get frames => UnmodifiableListView(_frames);

  UnmodifiableListView<int> get numbers =>
      UnmodifiableListView(_frames.map((e) => e.number));

  int get firstEmptySlot => _frames.indexWhere((f) => f.number == null);

  bool contains(int ref) {
    return _frames.contains(Frame(ref));
  }

  MemoryStack putAt(int index, Frame frame) {
    var newStack = List.of(frames);
    newStack[index] = frame;
    return MemoryStack._(newStack);
  }

  MemoryStack putAtIndexOf(int number, Frame frame) {
    return putAt(_frames.indexOf(Frame(number)), frame);
  }

  Map<String, dynamic> toMap() {
    return {
      'frames': _frames.map((e) => e.toMap()).toList(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (other is MemoryStack) {
      return _frames.sequenceEqual(other._frames);
    }
    return false;
  }

  @override
  int get hashCode => _frames.hashCode;
}
