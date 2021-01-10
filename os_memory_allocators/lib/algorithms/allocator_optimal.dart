

import '../models/models.dart';

class OptimalPolicyAllocator extends MemoryAllocator {
  @override
  AllocationTimeline calculate(List<int> references, int frameCount) {
    var snapshots = <AllocationSnapshot>[];
    var memory = MemoryStack.empty(frameCount);
    snapshots.add(AllocationSnapshot(null, false, memory));

    for (var i = 0; i < references.length; i++) {
      final ref = references[i];

      if (!memory.contains(ref)) { // page fault
        if (memory.emptySlots > 0) {
          memory = memory.putAt(memory.firstEmptySlot, Frame(ref));
        } else {
          var number = numberToReplace(
            references.sublist(i + 1),
            memory.numbers,
          );
          memory = memory.putAtIndexOf(number, Frame(ref));
        }
        snapshots.add(AllocationSnapshot(ref, true, memory));
      } else { // no page fault
        snapshots.add(AllocationSnapshot(ref, false, memory));
      }
    }

    return AllocationTimeline(snapshots);
  }

  // leastReferencedInTheFuture
  // select null or max(i)
  int numberToReplace(List<int> future, List<int> current) {
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
