import 'package:breaking_project/data_layer/models/character.dart';
import 'package:breaking_project/data_layer/web_service/charcters_web_services.dart';

class CharactersRepository {
  final CharctersWebServices charctersWebServices;

  CharactersRepository({required this.charctersWebServices});

  Future<List<dynamic>> getAllCharacters() async {
    final characters = await charctersWebServices.getAllCharacters();
    return characters['results'].map((ch)=>Character.fromJson(ch)).toList();
  }
}
