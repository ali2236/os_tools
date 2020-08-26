import 'package:angular/angular.dart';

import '../models/project.dart';

@Component(
  selector: 'project-card',
  template: '''
    <div class="uk-card uk-card-default">
        <div class="uk-card-header">
            <div class="uk-grid-small uk-flex-middle" uk-grid>
                <div class="uk-width-auto">
                    <img class="uk-border-circle" src="{{project.icon}}" alt="{{project.name}}_icon" width="32" height="32">
                </div>
                <h3 class="uk-card-title uk-width-expand">{{project.name}}</h3>
            </div>
        </div>
        <div class="uk-card-body">
            <p>{{project.description}}</p>
        </div>
    </div>
  ''',
)
class ProjectCard{
  @Input()
  Project project;
}