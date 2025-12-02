// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:breaking_project/data_layer/models/character.dart';

class Characters_details extends StatelessWidget {
  final Character character;
  const Characters_details({Key? key, required this.character})
    : super(key: key);

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: const Color.fromARGB(255, 67, 66, 66),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.name ?? "",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        background: Hero(
          tag: 1,
          child: Image.network(
            character.image ?? "assets/images/Error_404.gif",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines : 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
             text: title,
             style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
             )
        ),
        TextSpan(
             text: value,
             style: TextStyle(
              color: Colors.white,
              fontSize: 16,
             )
        ),
      ]
      ),
      );
  }
  Widget buildDivider(double endIndent){
   return Divider(
    color: Colors.yellow,
    height: 30,
    endIndent: endIndent,
    thickness: 2,
   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 89, 88, 88),

      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo('status :  ', character.status ?? ""), 
                  buildDivider(315),
                  characterInfo('species :  ', character.species ?? ""), 
                  buildDivider(315),
                  characterInfo('created :  ', character.created ?? ""), 
                  buildDivider(315),
                  characterInfo('gender :  ', character.gender ?? ""), 
                  buildDivider(315),
                  characterInfo('episode :  ', character.episode!.join(' / ')), 
                  buildDivider(315),
                  SizedBox(height:30),
                  ],
                ),
              ),
              SizedBox(height:400),
            ]),
          ),
        ],
      ),
    );
  }
}
