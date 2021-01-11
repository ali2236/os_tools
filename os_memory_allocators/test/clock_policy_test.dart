import 'package:os_memory_allocators/os_memory_allocators.dart';
import 'package:test/test.dart';

void main() {
  group('Clock Policy', ()
  {
    test('test 1', () {
      expect(
        ClockPolicy()
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
              pointer: 0,
            ),
            AllocationSnapshot(
              2,
              true,
              MemoryStack.fromFrames([
                CPFrame(2),
                Frame(null),
                Frame(null),
              ]),
              pointer: 1,
            ),
            AllocationSnapshot(
              3,
              true,
              MemoryStack.fromFrames([
                CPFrame(2),
                CPFrame(3),
                Frame(null),
              ]),
              pointer: 2,
            ),
            AllocationSnapshot(
              2,
              false,
              MemoryStack.fromFrames([
                CPFrame(2),
                CPFrame(3),
                Frame(null),
              ]),
              pointer: 2,
            ),
            AllocationSnapshot(
              1,
              true,
              MemoryStack.fromFrames([
                CPFrame(2),
                CPFrame(3),
                CPFrame(1),
              ]),
              pointer: 0,
            ),
            AllocationSnapshot(
              5,
              true,
              MemoryStack.fromFrames([
                CPFrame(5),
                CPFrame(3, 0),
                CPFrame(1, 0),
              ]),
              pointer: 1,
            ),
            AllocationSnapshot(
              2,
              true,
              MemoryStack.fromFrames([
                CPFrame(5),
                CPFrame(2),
                CPFrame(1, 0),
              ]),
              pointer: 2,
            ),
            AllocationSnapshot(
              4,
              true,
              MemoryStack.fromFrames([
                CPFrame(5),
                CPFrame(2),
                CPFrame(4),
              ]),
              pointer: 0,
            ),
            AllocationSnapshot(
              5,
              false,
              MemoryStack.fromFrames([
                CPFrame(5),
                CPFrame(2),
                CPFrame(4),
              ]),
              pointer: 0,
            ),
            AllocationSnapshot(
              3,
              true,
              MemoryStack.fromFrames([
                CPFrame(3),
                CPFrame(2, 0),
                CPFrame(4, 0),
              ]),
              pointer: 1,
            ),
            AllocationSnapshot(
              2,
              false,
              MemoryStack.fromFrames([
                CPFrame(3),
                CPFrame(2),
                CPFrame(4, 0),
              ]),
              pointer: 1,
            ),
            AllocationSnapshot(
              5,
              true,
              MemoryStack.fromFrames([
                CPFrame(3),
                CPFrame(2, 0),
                CPFrame(5),
              ]),
              pointer: 0,
            ),
            AllocationSnapshot(
              2,
              false,
              MemoryStack.fromFrames([
                CPFrame(3),
                CPFrame(2),
                CPFrame(5),
              ]),
              pointer: 0,
            ),
          ]),
        ),
      );
    });
  });
}