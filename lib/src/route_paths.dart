import 'package:angular_router/angular_router.dart';

//First create a file to hold route paths. Initialize it with this content.
const idParam = 'id';

int getId1(Map<String, String> parameters){
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}

class RoutePaths{
  static final heroes = RoutePath(path: 'heroes');
  static final dashboard = RoutePath(path: 'dashboard');
  static final gouvis = RoutePath(path: '${heroes.path}/:$idParam');
  // the colon (:) in the path indicates that: $idParam(:id) is a placeholder for a specific
  // hero ID when navigating to hero view.


}