// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'package:breaking_project/data_layer/repository/characters_repository.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersrepository;
  List<dynamic> ch =[];

  CharactersCubit(this.charactersrepository) : super(CharactersInitial());

  List<dynamic> getAllCharacters() {
   
    charactersrepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded( characters));
      ch = characters;
    });
    return ch;
  }
}
