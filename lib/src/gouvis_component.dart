import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'gouvis.dart';

import 'gouvis_service.dart';
import 'route_paths.dart';


@Component(
  selector: 'my-gouvis',
  directives: [coreDirectives, formDirectives],
  templateUrl: 'gouvis_component.html',
)
class GouvisComponent implements OnActivate{
  final GouvisService _gouvisService;
  final Location _location;
  Gouvis gouvis;

  GouvisComponent(this._gouvisService, this._location);

  @override
  void onActivate(_, RouterState current) async{
    int id = getId1(current.parameters);
    if(id != null){
      gouvis = await(_gouvisService.getId(id));
    }
  }

  void goBack(){
    _location.back();
  }
}