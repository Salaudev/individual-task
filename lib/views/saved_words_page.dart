import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX for state management
import 'package:uzbeng_dictionary_app/components/word-container.dart';
import 'package:uzbeng_dictionary_app/controllers/word_list_controller.dart';
import 'package:uzbeng_dictionary_app/models/word_model.dart';

class SavedWords extends StatefulWidget {
  @override
  _SavedWords createState() => _SavedWords();
}

class _SavedWords extends State<SavedWords> {
  final WordListController wordListController = Get.put(WordListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Words'),
        backgroundColor: Color.fromRGBO(93, 185, 98, 1),
      ),
      body: Obx(() {
        if (wordListController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<WordModel> savedWords = wordListController.words
              .where((word) => word.is_favourite == 1)
              .toList();
          return ListView.builder(
            itemCount: savedWords.length,
            itemBuilder: (context, index) {
              final word = savedWords[index];
              return WordCard(
                  word: word,
                  onPressedFavorite: () {
                    setState(() {
                      word.toggleFavorite();
                    });
                  });
            },
          );
        }
      }),
    );
  }
}
