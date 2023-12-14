import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'dart:io';

import 'package:uzbeng_dictionary_app/models/word_model.dart';
class DatabaseService {
  late Database _database;

  Future<void> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'dictionary1.db');

    // Check if the database already exists
    if (await databaseExists(path)) {
      _database = await openDatabase(path);
    } else {
      ByteData data = await rootBundle.load('assets/dictionary1.db');
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes);

      _database = await openDatabase(path);
    }
  }

  Future<List<Map<String, dynamic>>> fetchWords() async {
    await initDatabase();
    return await _database.query('dictionary');
  }

  Future<void> updateWord(WordModel word) async {

    await initDatabase();

    // Update the given Dog.
    await _database.update(
      'dictionary',
      word.toMap(),
      where: 'id = ?',
      whereArgs: [word.id],
    );
  }

  Future<WordModel> getRandomWord() async {
    await initDatabase();
    final List<Map<String, dynamic>> result = await _database.rawQuery(
      'SELECT * FROM dictionary ORDER BY RANDOM() LIMIT 1',
    );

    if (result.isNotEmpty) {
      return WordModel.fromMap(result.first);
    } else {
      throw Exception('No words found in the database.');
    }
  }

  Future<List<WordModel>> getWordsForFlashcards(int limit) async {
    await initDatabase();
    final List<Map<String, dynamic>> result = await _database.query(
      'dictionary',
      orderBy: 'RANDOM()',
      limit: limit,
    );

    return result.map((map) => WordModel.fromMap(map)).toList();
  }


  Future<WordModel> getNextWord() async {
    await initDatabase();
    // Fetch data from the database
    final List<Map<String, dynamic>> data = await _database.rawQuery(
      'SELECT * FROM dictionary ORDER BY RANDOM() LIMIT 6',
    );

    // Assuming you expect only one word, take the first element from the result
    final Map<String, dynamic> wordMap = data.isNotEmpty ? data.first : {};

    // Convert the map to a WordModel
    return WordModel.fromMap(wordMap);
  }

}
