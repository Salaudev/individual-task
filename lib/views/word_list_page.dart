import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uzbeng_dictionary_app/components/word-container.dart';
import 'package:uzbeng_dictionary_app/controllers/word_list_controller.dart';
import 'package:uzbeng_dictionary_app/models/word_model.dart';
import 'package:uzbeng_dictionary_app/views/word_details.dart';

class WordListPage extends StatefulWidget {
  @override
  _WordListPageState createState() => _WordListPageState();

}

class _WordListPageState extends State<WordListPage> {
  final WordListController wordListController = Get.put(WordListController());


  String searchQuery = '';

// Update the search query
  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }


  // Filtered word list based on search query
  List<WordModel> get filteredWords {
    return wordListController.words.where((word) {
      // Filter logic: modify it as per your requirements
      return word.english.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word List'),
        backgroundColor: Color.fromRGBO(93, 185, 98, 1),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Card(
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 5, right: 16, bottom: 5),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.volume_up,
                        color: Color.fromRGBO(200, 201, 201, 1)),
                    icon: Icon(Icons.search,
                        color: Color.fromRGBO(200, 201, 201, 1))),
                onChanged: updateSearchQuery,
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
      if (wordListController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ListView.builder(
          itemCount: filteredWords.length,
          itemBuilder: (context, index) {
            final word = filteredWords[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WordDetail(word: word),
                  ),
                );
              },
              child: WordCard(
                word: word,
                onPressedFavorite: () {
                  // Update favorite status in DB or controller
                  // wordListController.updateFavoriteStatus(word);
                  setState(() {
                    word.toggleFavorite();
                  });
                },
              ),
            );
          },
        );
      }
    }),
    );
  }
}
