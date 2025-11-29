import 'package:breaking_project/data_layer/models/character.dart';

class Results {
  List<dynamic>? results;

  Results({this.results});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Character>[];
      json['results'].forEach((v) {
        results!.add(Character.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
