// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:breaking_project/const/strings.dart';
import 'package:flutter/material.dart';

import 'package:breaking_project/data_layer/models/character.dart';

class CharacterItem extends StatelessWidget {
  final Character ch;

  const CharacterItem({super.key, required this.ch});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, characters_details,arguments: ch),
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
            ch.name!,style: TextStyle(
              color: const Color.fromARGB(255, 243, 238, 238),
              fontSize: 16,
              height: 1.3,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            ),
            ),
          child: Hero(
            tag: 1,
            child: Container(
              color: Colors.grey,
              child: ch.image!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: 'assets/images/loading.gif',
                      image: ch.image!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/iamges/cutie_patoti.png'),
            ),
          ),
          
        ),
      ),
    );
  }
}
