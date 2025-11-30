import 'package:breaking_project/business_logic_layer/cubit/characters_cubit.dart';
import 'package:breaking_project/presentation_layer/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<dynamic> allCharacters;

  @override
  void initState() {
    super.initState();
    allCharacters = BlocProvider.of<CharactersCubit>(
      context,
    ).getAllCharacters();
  }
  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          return buildLoadedListWidgets();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(255, 194, 191, 191),
        child: Column(children: [buildCharactersList()]),
      ),
    );
  }
  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allCharacters.length,
      itemBuilder: (context, index) {
        return CharacterItem(ch : allCharacters[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 190, 190, 23),
        title: Text(
          'Characters',
          style: TextStyle(color: const Color.fromARGB(255, 247, 242, 242)),
        ),
        centerTitle: true,
      ),
      body: buildBlocWidget(),
    );
  }
}
