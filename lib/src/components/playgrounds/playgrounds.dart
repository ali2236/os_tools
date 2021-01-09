import 'playground_project.dart';

class Playgrounds {
  static final cpu_scheduling = PlaygroundProject('cpu-scheduling', 'CPU Scheduling', 'Basic CPU Scheduling', tags: ['algorithms', 'cpu','scheduling']);
  static final frame_allocation = PlaygroundProject('frame-allocation', 'Frame Allocation', 'Basic Memory Frame Allocation', tags: ['algorithms', 'memory','allocation']);

  static final List<PlaygroundProject> playgrounds = [
    cpu_scheduling,
    frame_allocation,
  ];
}
