class Project {
  final String name;
  final String icon;
  final String description;
  final String type;
  final String source;

  Project({this.name, this.icon, this.description, this.type, this.source});

  factory Project.fromJson(Map json) {
    return Project(
      name: json['name'],
      icon: json['icon'],
      description: json['description'],
      type: json['type'],
      source: json['source'],
    );
  }
}
