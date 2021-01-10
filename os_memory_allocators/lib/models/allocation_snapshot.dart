

import 'memory_stack.dart';

class AllocationSnapshot {
  final int reference;
  final bool pageFault;
  final MemoryStack memory;

  AllocationSnapshot(this.reference ,this.pageFault, this.memory);

  Map<String, dynamic> toMap() {
    return {
      'reference' : reference,
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
