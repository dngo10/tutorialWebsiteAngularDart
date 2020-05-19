import 'gouvis.dart';
import 'mock_gouvis.dart';

class GouvisService{
  Future<List<Gouvis>> getAll() async{
    return personGouvis;
  }

  Future<Gouvis> getId(int id) async{
    return (await getAll()).firstWhere((element) => element.id == id);
  }
}