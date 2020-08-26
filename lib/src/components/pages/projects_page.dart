import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/components/project_card_component.dart';
import 'package:static_aligator_ir/src/models/project.dart';
import 'package:static_aligator_ir/src/services/project_service.dart';
@Component(
  selector: 'projects-page',
  template: '''
    <h1>Projects</h1>
    <h2>A list of my projects:</h2>
    <div id="projects">
      <div class="uk-grid-small uk-grid-match uk-child-width-1-1@s uk-child-width-1-2@m uk-child-width-1-3@l uk-child-width-1-3@xl" uk-grid>
        <div *ngFor="let project of projects">
          <project-card [project]="project"></project-card>
        </div>
      </div>
    </div>
  ''',
  directives: [coreDirectives, ProjectCard],
)
class ProjectsPage implements OnInit{
  List<Project> projects = [];

  final ProjectService _projectService;

  ProjectsPage(this._projectService);

  @override
  void ngOnInit() async{
    projects = await _projectService.getProjects();
  }

}