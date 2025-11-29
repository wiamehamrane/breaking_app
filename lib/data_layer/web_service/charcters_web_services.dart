import 'package:breaking_project/const/strings.dart';
import 'package:dio/dio.dart';

class CharctersWebServices {
  late Dio dio;
  CharctersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: BaseUrl,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString);
      return [];
    }
  }
}
