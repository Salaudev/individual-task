class WordModel {
  int id;
  String english;
  String type;
  String transcript;
  String uzbek;
  String? countable;
  int is_favourite;
  int? is_favourite_uzb;

  WordModel({
    required this.id,
    required this.english,
    required this.type,
    required this.transcript,
    required this.uzbek,
    required this.countable,
    required this.is_favourite,
    required this.is_favourite_uzb,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'english': english,
      'type': type,
      'transcript': transcript,
      'uzbek': uzbek,
      'countable': countable,
      'is_favourite': is_favourite,
      'is_favourite_uzb': is_favourite_uzb,
    };
  }


  void toggleFavorite() {
    is_favourite = is_favourite == 1 ? 0 : 1;
  }

  factory WordModel.fromMap(Map<String, dynamic> map) {
    return WordModel(
      id: map['id'],
      english: map['english'],
      uzbek: map['uzbek'],
      type: map['type'],
      transcript: map['transcript'],
      countable: map['countable'],
      is_favourite: map['is_favourite'],
      is_favourite_uzb: map['is_favourite_uzb'],
    );
  }
}

