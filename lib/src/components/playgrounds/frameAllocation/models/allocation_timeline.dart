import 'dart:convert';
import 'package:darq/darq.dart';
import 'package:os_aligator_ir/src/components/playgrounds/frameAllocation/models/allocation_snapshot.dart';

class AllocationTimeline {
  final List<AllocationSnapshot> snapshots;

  AllocationTimeline(this.snapshots);

  @override
  bool operator ==(Object other) {
    if (other is AllocationTimeline) {
      return snapshots.sequenceEqual(other.snapshots);
    }
    return false;
  }

  @override
  int get hashCode => snapshots.hashCode;

  @override
  String toString() {
    return jsonEncode(snapshots.map((e) => e.toMap()).toList());
  }
}
