class BabyModel {
  final String baby_name;
  final String meaning;
  final String gender;
  final String religion;
  final String rashi;
  final String isFavorite;

  const BabyModel({
    required this.baby_name,
    required this.meaning,
    required this.gender,
    required this.rashi,
    required this.religion,
    required this.isFavorite,
  });

  Map toMap() => {
        'baby_name': baby_name,
        'meaning': meaning,
        'gender': gender,
        'religion': religion,
        'rashi': rashi,
        'isFavorite': isFavorite,
      };
}
