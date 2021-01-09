import 'package:os_aligator_ir/src/components/playgrounds/frameAllocation/models/allocation_timeline.dart';

abstract class MemoryAllocator {

  AllocationTimeline calculate(List<int> references, int frameCount);

}