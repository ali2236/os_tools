import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/components/project_card_component.dart';
import 'package:static_aligator_ir/src/models/page_seo.dart';
import 'package:static_aligator_ir/src/models/project.dart';
import 'package:static_aligator_ir/src/services/project_service.dart';
@Component(
  selector: 'projects-page',
  template: '''
  <div class="container">
    <h1>{{pageTitle}}</h1>
    <h2>A list of my projects:</h2>
    <br/>
    <div id="projects">
      <div class="row">
          <project-card class="col-sm-12 col-md-6 col-lg-4" *ngFor="let project of projects" [project]="project"></project-card>
      </div>
    </div>
   </div>
  ''',
  directives: [coreDirectives, ProjectCard],
)
class ProjectsPage extends PageSEO{
  List<Project> projects = [];

  final ProjectService _projectService;

  ProjectsPage(this._projectService);

  @override
  String get pageTitle => 'Projects';

  @override
  void ngOnInit() async{
    super.ngOnInit();
    projects = await _projectService.getProjects();
  }

}