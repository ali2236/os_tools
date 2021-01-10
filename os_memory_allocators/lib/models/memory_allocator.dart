import 'allocation_timeline.dart';

abstract class MemoryAllocator {
  AllocationTimeline calculate(List<int> references, int frameCount);
}
