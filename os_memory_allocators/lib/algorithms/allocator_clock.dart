import 'package:os_memory_allocators/models/models.dart';

class ClockPolicy extends MemoryAllocator {
  @override
  AllocationTimeline calculate(List<int> references, int frameCount) {
    var snapshots = <AllocationSnapshot>[];
    var memory = MemoryStack.empty(frameCount);
    var clock = 0;
    snapshots.add(AllocationSnapshot(null, false, memory, pointer: clock));
    final incrementClock = () => clock = (clock + 1) % frameCount;
    final cpframe = () => memory.getFrameAt(clock) as CPFrame;

    for (var i = 0; i < references.length; i++) {
      final ref = references[i];
      if (!memory.contains(ref)) {
        // page fault
        var searching = true;
        while (searching) {
          // check if empty
          if (memory.emptyAt(clock)) {
            memory = memory.putAt(clock, CPFrame(ref));
            searching = false;
          } else if (cpframe().useBit == 0) {
            // check if 0
            memory = memory.putAt(clock, CPFrame(ref));
            searching = false;
          } else {
            // if 1 -> 0
            memory = memory.putAt(clock, CPFrame(cpframe().number, 0));
          }
          incrementClock();
          if(!searching) {
            snapshots.add(
                AllocationSnapshot(ref, true, memory, pointer: clock));
          }
        }
      } else {
        // no page fault
        memory = memory.putAtIndexOf(ref, CPFrame(ref));
        snapshots.add(AllocationSnapshot(ref, false, memory, pointer: clock));
      }
    }

    return AllocationTimeline(snapshots);
  }
}

// ClockPolicyFrame
class CPFrame extends Frame {
  final int useBit;
  CPFrame(int number,[this.useBit = 1]) : super(number);

  @override
  Map<String, dynamic> toMap() {
    return {
      'useBit': useBit,
      ...super.toMap(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (other is CPFrame) {
      return useBit == other.useBit && super == other;
    }
    return super == other;
  }
}
