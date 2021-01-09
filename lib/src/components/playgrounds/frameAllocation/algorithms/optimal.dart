import 'package:os_aligator_ir/src/components/playgrounds/frameAllocation/models/allocation_snapshot.dart';
import 'package:os_aligator_ir/src/components/playgrounds/frameAllocation/models/allocation_timeline.dart';
import 'package:os_aligator_ir/src/components/playgrounds/frameAllocation/models/frame.dart';
import 'package:os_aligator_ir/src/components/playgrounds/frameAllocation/models/memory_allocator.dart';
import 'package:os_aligator_ir/src/components/playgrounds/frameAllocation/models/memory_stack.dart';

class OptimalPolicyAllocator extends MemoryAllocator {
  @override
  AllocationTimeline calculate(List<int> references, int frameCount) {
    var snapshots = <AllocationSnapshot>[];
    var memory = MemoryStack.empty(frameCount);
    snapshots.add(AllocationSnapshot(false, memory));

    for (var i = 0; i < references.length; i++) {
      final ref = references[i];

      if (!memory.contains(ref)) { // page fault
        if (memory.emptySlots > 0) {
          memory = memory.putAt(memory.firstEmptySlot, Frame(ref));
        } else {
          var number = leastReferencedInTheFuture(
            references.sublist(i + 1),
            memory.numbers,
          );
          memory = memory.putAtIndexOf(number, Frame(ref));
        }
        snapshots.add(AllocationSnapshot(true, memory));
      } else { // no page fault
        snapshots.add(AllocationSnapshot(false, memory));
      }
    }

    return AllocationTimeline(snapshots);
  }

  int leastReferencedInTheFuture(List<int> future, List<int> current) {
    var firstSeen =
        Map.fromEntries(current.map((e) => MapEntry<int, int>(e, null)));
    for (var i = 0; i < future.length; i++) {
      var fr = future[i];
      if (firstSeen[fr] == null) {
        firstSeen[fr] = i;
      }
    }
    var number = current.first;
    var lastFirstSeen = firstSeen[number];
    for (var i in current) {
      if (firstSeen[i] == null) {
        return i;
      } else if (firstSeen[i] > lastFirstSeen) {
        lastFirstSeen = firstSeen[i];
        number = i;
      }
    }
    return number;
  }
}
