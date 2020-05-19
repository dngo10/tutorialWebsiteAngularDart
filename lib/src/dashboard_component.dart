import 'package:TourOfHeroes/src/route_paths.dart';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'gouvis_service.dart';
import 'gouvis.dart';

@Component(
  selector: 'my-daskboard',
  templateUrl: 'dashboard_component.html',
  directives: [coreDirectives,routerDirectives],
  
)
class DashboardComponent implements OnInit {
  List<Gouvis> gouvises;
  final GouvisService _gouvisService;

  DashboardComponent(this._gouvisService);

  @override
  void ngOnInit() async{
    gouvises = (await _gouvisService.getAll()).skip(1).take(4).toList();
  }

  String gouvisUrl(int id){
    return RoutePaths.gouvis.toUrl(parameters: {idParam: '$id'});
  }
}