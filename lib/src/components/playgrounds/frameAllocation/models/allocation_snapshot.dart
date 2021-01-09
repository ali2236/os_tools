import 'package:os_aligator_ir/src/components/playgrounds/frameAllocation/models/memory_stack.dart';

class AllocationSnapshot {
  final bool pageFault;
  final MemoryStack memory;

  AllocationSnapshot(this.pageFault, this.memory);

  Map<String, dynamic> toMap() {
    return {
      'pageFault': pageFault,
      'memory': memory.toMap(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (other is AllocationSnapshot) {
      return memory == other.memory;
    }
    return false;
  }

  @override
  int get hashCode => pageFault.hashCode ^ memory.hashCode;
}
