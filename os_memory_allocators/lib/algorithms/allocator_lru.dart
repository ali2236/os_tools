import '../models/models.dart';

class LeastRecentlyUsed extends MemoryAllocator {

  @override
  AllocationTimeline calculate(List<int> references, int frameCount) {
    var snapshots = <AllocationSnapshot>[];
    var memory = MemoryStack.empty(frameCount);
    snapshots.add(AllocationSnapshot(null,false, memory));

    for (var i = 0; i < references.length; i++) {
      final ref = references[i];

      if (!memory.contains(ref)) { // page fault
        if (memory.emptySlots > 0) {
          memory = memory.putAt(memory.firstEmptySlot, Frame(ref));
        } else {
          var number = numberToReplace(
            references.sublist(0, i),
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

  // leastReferencedInThePast
  // select null or min(i)
  int numberToReplace(List<int> past, List<int> current) {
    var lastSeen = Map.fromEntries(current.map((e) => MapEntry<int, int>(e, null)));
    for (var i = past.length - 1; i >= 0; i--) {
      var pr = past[i];
      if (lastSeen[pr] == null) {
        lastSeen[pr] = i;
      }
    }
    var number = current.first;
    var lastLastSeen = lastSeen[number];
    for (var i in current) {
      if (lastSeen[i] == null) {
        return i;
      } else if (lastSeen[i] < lastLastSeen ) {
        lastLastSeen = lastSeen[i];
        number = i;
      }
    }
    return number;
  }

}