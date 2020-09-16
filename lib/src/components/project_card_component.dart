import 'package:angular/angular.dart';

import '../models/project.dart';

@Component(
  selector: 'project-card',
  template: '''
  <div class="card project-card mb-4">
    <div class="card-title project-title mt-2">{{project.name}}</div>
    <div class="card-body">
        <p>{{project.description}}</p>
    </div>
</div>''',
  styles:['.project-card{height:12rem}',
  '''.project-title{
         font-family: "nerisblack", sans-serif;
         font-size: 16pt;
         text-align: center;
     }'''
],
)
class ProjectCard{
  @Input()
  Project project;
}