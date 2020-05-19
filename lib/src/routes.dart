import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';

//The Angular compiler generates component factories behind the scenes when you build the app.
//To access the factory you need to import the generated component template file
import 'gouvis_list_component.template.dart' as gouvis_list_template;
import 'dashboard_component.template.dart' as dashboard_template;
import 'gouvis_component.template.dart' as gouvis_template;


export 'route_paths.dart';

//Routes tell the router which views to display when a user clicks a link or pasters a URL
//into the browser address bar.

class Routes{

  //This is one path
  static final heroes = RouteDefinition(
    routePath: RoutePaths.heroes,
    component: gouvis_list_template.GouvisListComponentNgFactory,
  );

  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
  );

  static final gouvis = RouteDefinition(
    routePath: RoutePaths.gouvis,
    component: gouvis_template.GouvisComponentNgFactory,
  );

  //list of route definitions.
  static final all = <RouteDefinition>[
    dashboard,
    heroes,
    gouvis,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.dashboard.toUrl(),
    )
  ];
}

/**
 * routePath: The router matches this path against the URL in the browser address bar (heroes)
 * component: The (factory of the) component that will be activated when this route is navigated to
 * (gouvis_list_template.GouvisListComponentNgFactory)
 */