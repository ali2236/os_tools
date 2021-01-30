import 'package:angular_router/angular_router.dart';
import 'package:os_aligator_ir/src/components/playgrounds/playgrounds.dart';
import '../components/playgrounds/playgrounds_page.template.dart' as playgrounds;
import '../components/playgrounds/cpuScheduling/cpu_scheduling_page.template.dart' as cpus;
import '../components/playgrounds/frameAllocation/frame_allocation_page.template.dart' as frames;
import 'route_paths.dart';

class Routes {
  static final all = <RouteDefinition>[
    RouteDefinition(
      path: RoutePaths.playgrounds.path,
      component: playgrounds.PlaygroundsPageNgFactory,
    ),
    RouteDefinition(
      routePath: Playgrounds.cpu_scheduling.path,
      component: cpus.CpuSchedulingPageNgFactory,
    ),
    RouteDefinition(
      routePath: Playgrounds.frame_allocation.path,
      component: frames.FrameAllocationPageNgFactory,
    ),
    RouteDefinition.redirect(
      path: '.*',
      redirectTo: '',
    ),
  ];
}
