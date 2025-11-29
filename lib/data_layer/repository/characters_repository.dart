import 'package:breaking_project/data_layer/models/result.dart';
import 'package:breaking_project/data_layer/web_service/charcters_web_services.dart';

class CharactersRepository {
  final CharctersWebServices charctersWebServices;

  CharactersRepository({required this.charctersWebServices});

   Future<List<dynamic>> getAllCharacters() async {
    final charactersjson = await charctersWebServices.getAllCharacters();
    return charactersjson.map((ch)=>Results.fromJson(ch)).toList();
  }
}
