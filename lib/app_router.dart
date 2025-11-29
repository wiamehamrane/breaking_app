
import 'package:breaking_project/const/strings.dart';
import 'package:breaking_project/presentation_layer/screens/characters_details.dart';
import 'package:breaking_project/presentation_layer/screens/characters_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen :
        return MaterialPageRoute(builder: (_) => CharactersScreen());

        case characters_details :
        return MaterialPageRoute(builder: (_) => Characters_details());
    
    }
    return null;
    
   
  }
}
