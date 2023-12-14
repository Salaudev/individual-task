import 'package:flutter/material.dart';
import 'package:uzbeng_dictionary_app/models/word_model.dart';

class WordCard extends StatelessWidget {
  final WordModel word;
  final VoidCallback onPressedFavorite;

  const WordCard({
    required this.word,
    required this.onPressedFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ListTile(
          leading: Icon(
            Icons.light_mode,
            color: Color.fromRGBO(92, 185, 98, 1),
          ),
          title: Text(
            word.english,
            style: TextStyle(fontSize: 18),
          ),
          subtitle: Text(
            "[ ${word.transcript} ]",
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),
          trailing: IconButton(
            icon: word.is_favourite == 1
                ? Icon(Icons.bookmark, color: Color.fromRGBO(92, 185, 98, 1))
                : Icon(Icons.bookmark_outline, color: Color.fromRGBO(92, 185, 98, 1)),
            onPressed: onPressedFavorite,
          ),
        ),
      ),
    );
  }
}
