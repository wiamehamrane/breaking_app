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
  late List<dynamic> SearchedForCharacter;
  bool isSearching = false;
  final searchTextController = TextEditingController();

  Widget buildSearchField() {
    return TextField(
      controller: searchTextController,
      cursorColor: const Color.fromARGB(255, 58, 56, 56),
      decoration: InputDecoration(
        hintText: 'find a character......',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
      ),
      style: TextStyle(color: Colors.grey, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedForItemToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedForItemToSearchedList(String searchedCharacter) {
    SearchedForCharacter = allCharacters
        .where(
          (character) =>
              character.name.toLowerCase().startsWith(searchedCharacter),
        )
        .toList();
    setState(() {});
  }

  List<Widget> buildAppBarAction() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            clearSearching;
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear),
          color: const Color.fromARGB(255, 47, 46, 46),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: startSearching,
          icon: Icon(Icons.search),
          color: const Color.fromARGB(255, 46, 45, 45),
        ),
      ];
    }
  }

  void startSearching() {
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearching() {
    clearSearching();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearching() {
    setState(() {
      searchTextController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
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
      itemCount: searchTextController.text.isEmpty
          ? allCharacters.length
          : SearchedForCharacter.length,
      itemBuilder: (context, index) {
        return CharacterItem(
          ch: searchTextController.text.isEmpty
              ? allCharacters[index]
              : SearchedForCharacter[index],
        );
      },
    );
  }

  Widget buildAppBarTitle() {
    return Text(
      'Characters',
      style: TextStyle(color: const Color.fromARGB(255, 57, 56, 56)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 190, 190, 23),
        leading: isSearching ? BackButton(color: Colors.black) : Container(),
        title: isSearching ? buildSearchField() : buildAppBarTitle(),
        actions: buildAppBarAction(),
      ),
      body: buildBlocWidget(),
    );
  }
}
