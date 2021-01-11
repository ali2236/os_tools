import 'package:os_memory_allocators/models/models.dart';

class FirstInFirstOut extends MemoryAllocator{

  @override
  AllocationTimeline calculate(List<int> references, int frameCount) {
    var snapshots = <AllocationSnapshot>[];
    var memory = MemoryStack.empty(frameCount);
    snapshots.add(AllocationSnapshot(null,false, memory));
    var index = 0;
    for (var i = 0; i < references.length; i++) {
      index %= frameCount;
      final ref = references[i];
      if (!memory.contains(ref)) { // page fault
        memory = memory.putAt(index++, Frame(ref));
        snapshots.add(AllocationSnapshot(ref, true, memory, pointer: index));
      } else { // no page fault
        snapshots.add(AllocationSnapshot(ref, false, memory, pointer: index));
      }
    }

    return AllocationTimeline(snapshots);
  }

}