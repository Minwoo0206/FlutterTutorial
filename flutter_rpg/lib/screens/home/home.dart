import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';

import '../../models/character.dart';
import '../create/create.dart';
import 'character_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle("Your Characters"),
        centerTitle: true,  
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: characters.length,
              itemBuilder: (_, index) {
                return CharacterCard(characters[index]);
              },
            ),
          ),

          StyledButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (ctx) => const Create(),
              ));
            }, 
            child: const StyledHeading('Create New'),
          )
        ],),
      ),
    );
  }
}