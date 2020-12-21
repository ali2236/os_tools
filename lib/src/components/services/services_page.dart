import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/components/page_header.component.dart';
import 'package:static_aligator_ir/src/components/services/service.dart';
import 'package:static_aligator_ir/src/components/services/service_card.component.dart';
import 'package:static_aligator_ir/src/components/services/services.dart' as s;
import 'package:static_aligator_ir/src/models/page_seo.dart';

@Component(
  selector: 'service-page',
  template: '''
    <div class="container">
        <page-header [page]="thisPage"></page-header>
        <div class="my-4" *ngFor="let service of services">
            <service-card [service]="service"></service-card>
        </div>
    </div>
  ''',
  directives: [coreDirectives,ServiceCard, PageHeader],
)
class ServicesPage extends PageSEO {

  List<Service> services = s.services;

  @override
  String get pageTitle => 'Services';

  @override
  String get pageDescription => 'Services provided by aligator.';
}