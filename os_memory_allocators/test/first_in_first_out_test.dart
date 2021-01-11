import 'package:os_memory_allocators/os_memory_allocators.dart';
import 'package:test/test.dart';

void main() {
  group('First In First Out', () {
    test('test 1', () {
      expect(
        FirstInFirstOut()
            .calculate([2, 3, 2, 1, 5, 2, 4, 5, 3, 2, 5, 2], 3),
        equals(
          AllocationTimeline([
            AllocationSnapshot(
              null,
              false,
              MemoryStack.fromFrames([
                Frame(null),
                Frame(null),
                Frame(null),
              ]),
            ),
            AllocationSnapshot(
              2,
              true,
              MemoryStack.fromFrames([
                Frame(2),
                Frame(null),
                Frame(null),
              ]),
            ),
            AllocationSnapshot(
              3,
              true,
              MemoryStack.fromFrames([
                Frame(2),
                Frame(3),
                Frame(null),
              ]),
            ),
            AllocationSnapshot(
              2,
              false,
              MemoryStack.fromFrames([
                Frame(2),
                Frame(3),
                Frame(null),
              ]),
            ),
            AllocationSnapshot(
              1,
              true,
              MemoryStack.fromFrames([
                Frame(2),
                Frame(3),
                Frame(1),
              ]),
            ),
            AllocationSnapshot(
              5,
              true,
              MemoryStack.fromFrames([
                Frame(5),
                Frame(3),
                Frame(1),
              ]),
            ),
            AllocationSnapshot(
              2,
              true,
              MemoryStack.fromFrames([
                Frame(5),
                Frame(2),
                Frame(1),
              ]),
            ),
            AllocationSnapshot(
              4,
              true,
              MemoryStack.fromFrames([
                Frame(5),
                Frame(2),
                Frame(4),
              ]),
            ),
            AllocationSnapshot(
              5,
              false,
              MemoryStack.fromFrames([
                Frame(5),
                Frame(2),
                Frame(4),
              ]),
            ),
            AllocationSnapshot(
              3,
              true,
              MemoryStack.fromFrames([
                Frame(3),
                Frame(2),
                Frame(4),
              ]),
            ),
            AllocationSnapshot(
              2,
              false,
              MemoryStack.fromFrames([
                Frame(3),
                Frame(2),
                Frame(4),
              ]),
            ),
            AllocationSnapshot(
              5,
              true,
              MemoryStack.fromFrames([
                Frame(3),
                Frame(5),
                Frame(4),
              ]),
            ),
            AllocationSnapshot(
              2,
              true,
              MemoryStack.fromFrames([
                Frame(3),
                Frame(5),
                Frame(2),
              ]),
            ),
          ]),
        ),
      );
    });
  });
}