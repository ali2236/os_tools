import 'dart:convert';

import 'package:fanoos_http/fanoos_http.dart';

import '../models/project.dart';

class ProjectService {
  Future<List<Project>> getProjects() {
    return httpGet(
      url: '/api/projects/projects.json',
      bodyParser: jsonDecode,
      onOk: (json) => (json as Iterable)
          .map((p) => Project.fromJson(p))
          .toList()
          .cast<Project>(),
    );
  }
}
