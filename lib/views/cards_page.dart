import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uzbeng_dictionary_app/controllers/cards_controller.dart';
import 'package:uzbeng_dictionary_app/models/word_model.dart';

class CardsPage extends StatefulWidget {
  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  final CardController gameController = Get.put(CardController());

  void getNextWord() {
    gameController.fetchWords(); // Assuming this function fetches the next word
  }

  void reloadWords() {
    setState(() {
      getNextWord(); // Fetch new set of words on reload
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcards Game'),
        backgroundColor: Color.fromRGBO(93, 185, 98, 1),
      ),
      body: GetBuilder<CardController>(
        builder: (_) {
          if (gameController.words.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            final currentWord = gameController.words[0];
            final options = gameController.words.toList()..shuffle();

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentWord.english,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: List.generate(6, (index) {
                      return Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                backgroundColor: Color.fromRGBO(93, 185, 98, 1),
                              ),
                              onPressed: () {
                                if (options[index].uzbek == currentWord.uzbek) {
                                  print('Correct!');
                                  reloadWords(); // Fetch the next word on correct answer
                                } else {
                                  print('Incorrect!');
                                }
                              },
                              child: Text(options[index].uzbek),
                            ),
                          ));
                    }),
                  ),
                  SizedBox(height: 20),
                  IconButton(
                      onPressed: reloadWords,
                      icon: Icon(
                        Icons.replay,
                        color: Colors.green,
                      ))
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
