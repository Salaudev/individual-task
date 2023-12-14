// Define enum for pages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uzbeng_dictionary_app/views/about.dart';
import 'package:uzbeng_dictionary_app/views/cards_page.dart';
import 'package:uzbeng_dictionary_app/views/saved_words_page.dart';
import 'package:uzbeng_dictionary_app/views/word_list_page.dart';

enum Page {
  home,
  favorites,
  cards,
  about
}

class MyBottomNavBar extends StatefulWidget {
  @override
  _MyBottomNavBar createState() =>
      _MyBottomNavBar();
}

class _MyBottomNavBar extends State<MyBottomNavBar> {
  Page _selectedPage = Page.home;
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(_selectedPage),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromRGBO(93, 185, 98, 1), // Set the selected item color
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedPage.index,
        onTap: (int index) {
          if(index == 1){
            setState(() {
              isBookmarked = true;
            });
          }
          setState(() {
            _selectedPage = Page.values[index];
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
    );
  }

  Widget _getPage(Page page) {
    switch (page) {
      case Page.home:
        return WordListPage();
      case Page.favorites:
        return SavedWords();
      case Page.about:
        return AboutPage();
      case Page.cards:
        return CardsPage();
    }
  }
}
