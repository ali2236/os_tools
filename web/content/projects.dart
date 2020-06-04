
Map<String, dynamic> projectsPlugin(){
  return {
    'projects' : projects.map((e) => e.toMap()),
  };
}

class Project{
  final String name;
  final String icon;
  final String description;
  final ProjectType type;
  final SourceMode source;

  Project({this.name, this.icon, this.description, this.type, this.source});

  Map<String, dynamic> toMap(){
    return {
      'name' : name,
      'icon' : icon,
      'description' : description,
      'isOpenSource' : source.index == 0,
      'type' : type.toString(),
    };
  }
}

enum ProjectType {
  app, library
}

enum SourceMode {
  OpenSource, ClosedSource,
}

final projects = <Project>[
  Project(
    name: 'Prayer Times',
    icon: '/static/upload/icons/prayertimes.png',
    description:
    'PrayerTimes is an islamic calendar that can show you exact prayer times and play adhan.',
    type: ProjectType.app,
    source: SourceMode.ClosedSource,
  ),
  Project(
    name: 'Tile Tap',
    icon: '/static/upload/icons/tiletap.png',
    description: '5 different fun Games about tapping Tiles.',
    type: ProjectType.app,
    source: SourceMode.ClosedSource,
  ),
  Project(
    name: 'Aligator.ir',
    icon: '/static/upload/icons/aligator.png',
    description: 'My personal site.',
    type: ProjectType.app,
    source: SourceMode.ClosedSource,
  ),
  Project(
    icon: '/static/upload/icons/flutter.png',
    name: 'localization_table',
    description: 'Localize you app using a localization table.',
    type: ProjectType.library,
    source: SourceMode.OpenSource,
  ),
  Project(
    icon: '/static/upload/icons/flutter.png',
    name: 'localization_table',
    description: 'Localize you app using a localization table.',
    type: ProjectType.library,
    source: SourceMode.OpenSource,
  ),
  Project(
    icon: '/static/upload/icons/flutter.png',
    name: 'future_or',
    description: 'A collection of widgets, methods and extention methods that make working with FutureOr objects easier.',
    type: ProjectType.library,
    source: SourceMode.OpenSource,
  ),
  Project(
    icon: '/static/upload/icons/dart.png',
    name: 'json_isolate',
    description: 'The isolate that will help you convert json in the background.'
        ' You no longer need to block your main thread to convert a super long json string.',
    type: ProjectType.library,
    source: SourceMode.OpenSource,
  ),
  Project(
    icon: '/static/upload/icons/dart.png',
    name: 'downloadable',
    description: 'Downloadable is a file that might be in internal storage or still not downloaded.',
    type: ProjectType.library,
    source: SourceMode.OpenSource,
  ),
  Project(
    icon: '/static/upload/icons/flutter.png',
    name: 'android_calendar_intents',
    description: 'A number of intents to open on the devices calendar.',
    type: ProjectType.library,
    source: SourceMode.OpenSource,
  ),
  Project(
    icon: '/static/upload/icons/flutter.png',
    name: 'iran_appmarket',
    description: 'A Flutter plugin to open the apps page in an iranian android market.',
    type: ProjectType.library,
    source: SourceMode.OpenSource,
  ),
  Project(
    icon: '/static/upload/icons/flutter.png',
    name: 'smart_grid_view',
    description: 'A responsive grid view that changes it\'s cross axis child count based on the available horizontal size.',
    type: ProjectType.library,
    source: SourceMode.OpenSource,
  ),
  Project(
    icon: '/static/upload/icons/dart.png',
    name: 'abstarct_date',
    description: 'Abstract date is a fluent abstract date system for working with different date types.',
    type: ProjectType.library,
    source: SourceMode.OpenSource,
  ),
  Project(
    icon: '/static/upload/icons/flutter.png',
    name: 'inherited_store',
    description: 'An inherited widget that holds data and rebuilds the widgets whom depend on the changed data.',
    type: ProjectType.library,
    source: SourceMode.OpenSource,
  ),
  Project(
    icon: '/static/upload/icons/flutter.png',
    name: 'no_scroll_glow',
    description: 'A Scroll behavior like android\'s scroll behavior but without the glow.',
    type: ProjectType.library,
    source: SourceMode.OpenSource,
  ),
  Project(
    icon: '/static/upload/icons/flutter.png',
    name: 'context_extensions',
    description: 'Various extensions on BuildContext to access inherited widget\'s state.',
    type: ProjectType.library,
    source: SourceMode.OpenSource,
  ),
  Project(
    icon: '/static/upload/icons/flutter.png',
    name: 'loader',
    description: 'Run asynchronous code before building your widget. Loader will rebuild your widget after the loading is complete.',
    type: ProjectType.library,
    source: SourceMode.OpenSource,
  ),
];
