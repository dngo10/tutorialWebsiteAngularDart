import 'package:TourOfHeroes/src/route_paths.dart';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'gouvis.dart';
import 'mock_gouvis.dart';
import 'gouvis_service.dart';

// AngularDart info: https://angulardart.dev
// Components info: https://angulardart.dev/components

//At the end of the day, AppComponent SHOULD ONLY PRESENT A SHELL WITH A CHOICE OF VIEWS.
//It should only handle navigation.

@Component(
  selector: 'my-gouvises',
  styleUrls: ['gouvis_list_component.css'],
  templateUrl: 'gouvis_list_component.html',
  directives: [formDirectives, coreDirectives], //Use something, add directives
  providers: [ClassProvider(GouvisService)], // Use a service
  pipes: [commonPipes],
)

//The providers parameter tells Angular to create a fresh instance of the GouvisService when it create AppComponent.
//AppComponent, as well as its child components, can use that service to get hero data.

class GouvisListComponent {
  String name = 'Gouvis Group Engineering';
  final title = 'Tour of Gouvis';
  List<Gouvis> gouviss = personGouvis;
  Gouvis seletectGouvis;
  final GouvisService _gouvisService;
  final Router _router;

  GouvisListComponent(this._gouvisService, this._router);


  void onSelect(Gouvis gouvis){
    seletectGouvis = gouvis;
  }

  void getPerson(List<Gouvis> persons){
    gouviss = persons;
  }

  void _getGouvis(){
    _gouvisService.getAll().then((persons) => gouviss = persons);
  }

  Future<void> _getGouvis1() async{ // you can do like this
    gouviss = await _gouvisService.getAll();
  }

  void ngOnInit(){
    _getGouvis();
  }

  String _gouvisUrl(int id){
    return RoutePaths.gouvis.toUrl(parameters: {idParam: '$id'});
  }

  Future<NavigationResult> gotoDetail(){
    return _router.navigate( _gouvisUrl(seletectGouvis.id));
  }
}
