import 'playground_project.dart';

class Playgrounds {
  static final cpu_scheduling = PlaygroundProject('cpu-scheduling', 'CPU Scheduling', 'Basic CPU Scheduling', tags: ['algorithms', 'cpu','scheduling']);
  static final page_replacement = PlaygroundProject('page-replacement', 'Page Replacement', 'Simulate Memory Page Replacement Algorithms', tags: ['algorithms', 'memory','page','frame']);

  static final List<PlaygroundProject> playgrounds = [
    cpu_scheduling,
    page_replacement,
  ];
}
