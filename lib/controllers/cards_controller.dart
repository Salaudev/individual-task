import 'package:get/get.dart';
import 'package:uzbeng_dictionary_app/models/word_model.dart';
import 'package:uzbeng_dictionary_app/services/database_service.dart';

class CardController extends GetxController {
  final DatabaseService databaseService = DatabaseService();
  final RxList<WordModel> words = <WordModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchWords();
  }

  Future<void> fetchWords() async {
    try {
      final List<WordModel> fetchedWords =
      await databaseService.getWordsForFlashcards(6);
      words.assignAll(fetchedWords);
    } catch (e) {
      // Handle error
      print('Error fetching words: $e');
    }
  }

  void fetchNextWord() async {
    try {
      final nextWordData = await databaseService.getNextWord();
      if (nextWordData != null && nextWordData is Map<String, dynamic>) {
        final nextWord = WordModel.fromMap(nextWordData as Map<String, dynamic>);
        if (nextWord != null) {
          // Remove the previous word(s) and add the new one
          words.clear();
          words.add(nextWord);
        }
      }

      print(words[0].id);
    } catch (e) {
      print('Error fetching next word: $e');
    }
  }



}