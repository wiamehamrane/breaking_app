import 'package:breaking_project/business_logic_layer/cubit/characters_cubit.dart';
import 'package:breaking_project/const/strings.dart';
import 'package:breaking_project/data_layer/models/character.dart';
import 'package:breaking_project/data_layer/repository/characters_repository.dart';
import 'package:breaking_project/data_layer/web_service/charcters_web_services.dart';
import 'package:breaking_project/presentation_layer/screens/characters_details.dart';
import 'package:breaking_project/presentation_layer/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(
      charctersWebServices: CharctersWebServices(),
    );
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharactersCubit(charactersRepository),
            child: CharactersScreen(),
          ),
        );

      case characters_details:
        final character = settings.arguments as Character;
        return MaterialPageRoute(builder: (_) => Characters_details(character : character));
    }
  }
}
