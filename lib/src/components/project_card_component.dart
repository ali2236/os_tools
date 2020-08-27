import 'package:angular/angular.dart';

import '../models/project.dart';

@Component(
  selector: 'project-card',
  template: '''<div class="card project-card mb-4">
    <div class="card-title">
        <div class="row">
            <div class="col-3">
                <img class="uk-border-circle"
                     src="{{project.icon}}"
                     alt="{{project.name}}_icon"
                     width="32" height="32">
            </div>
            <h3 class="col-9">{{project.name}}</h3>
        </div>
    </div>
    <div class="card-body">
        <p>{{project.description}}</p>
    </div>
</div>''',
  styles:['.project-card{height:12rem}'],
)
class ProjectCard{
  @Input()
  Project project;
}