import 'dart:convert';
import 'package:darq/darq.dart';

import 'allocation_snapshot.dart';

class AllocationTimeline {
  final List<AllocationSnapshot> snapshots;

  AllocationTimeline(this.snapshots);

  int get pageFaults => snapshots.map((e) => e.pageFault).where((e) => e==true).length;

  @override
  bool operator ==(Object other) {
    if (other is AllocationTimeline) {
      return snapshots.sequenceEqual(other.snapshots);
    }
    return false;
  }

  @override
  int get hashCode => snapshots.hashCode;

  Map<String, dynamic> toMap(){
    return {
      'page_faults' : pageFaults,
      'snapshots': snapshots.map((e) => e.toMap()).toList(),
    };
  }

  @override
  String toString() => jsonEncode(toMap());
}
