import 'package:get/get.dart';
import 'package:uzbeng_dictionary_app/models/word_model.dart';
import 'package:uzbeng_dictionary_app/services/database_service.dart';

class WordListController extends GetxController {
  DatabaseService _databaseService = DatabaseService();
  RxBool isLoading = true.obs;
  RxList<WordModel> words = <WordModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchWords();
  }

  void fetchWords() async {
    isLoading.value = true;
    try {
      final List<Map<String, dynamic>> wordRecords =
          await _databaseService.fetchWords();
      words.assignAll(_convertToWordModels(wordRecords));
    } catch (e) {
      // Handle error, show message, etc.
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  List<WordModel> _convertToWordModels(List<Map<String, dynamic>> records) {
    return records.map((record) {
      return WordModel(
          english: record['english'],
          countable: record['countable'],
          uzbek: record['uzbek'],
          id: record['id'],
          type: record['type'],
          transcript: record['transcript'],
          is_favourite: record['is_favourite'],
          is_favourite_uzb: record['is_favourite_uzb']);
    }).toList();
  }

  void updateFavoriteStatus(WordModel updatedWord) async {
    isLoading.value = true;
    try {
      await _databaseService.updateWord(updatedWord);
    } catch (e) {
      // Handle error, show message, etc.
      print(e);
    } finally {
      isLoading.value = false;
      print('Updated');
    }
  }
}
