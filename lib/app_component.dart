import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/gouvis_service.dart';
import 'src/routes.dart';

/**
 * When you visit localhost:8080/#/heroes, the router should match the URL to the
 * heroes route and display a HeroListComponent. However, you have to tell the router where
 * to display the component.
 */

// AngularDart info: https://angulardart.dev
// Components info: https://angulardart.dev/components

//At the end of the day, AppComponent SHOULD ONLY PRESENT A SHELL WITH A CHOICE OF VIEWS.
//It should only handle navigation.

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [routerDirectives], //Use something, add directives 
  providers: [ClassProvider(GouvisService)], // Use a service
  exports: [RoutePaths, Routes]
)

//The providers parameter tells Angular to create a fresh instance of the GouvisService when it create AppComponent.
//AppComponent, as well as its child components, can use that service to get hero data.

class AppComponent {
  String name = 'Gouvis Group Engineering';
  final title = 'Tour of Gouvis';
}
