// lib/models/champion.dart
class Champion {
  final String id;
  final String name;
  final String title;
  final String blurb;
  final String image;

  Champion({
    required this.id,
    required this.name,
    required this.title,
    required this.blurb,
    required this.image,
  });

  factory Champion.fromJson(String id, Map<String, dynamic> json) {
    return Champion(
      id: id,
      name: json['name'],
      title: json['title'],
      blurb: json['blurb'],
      image: 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/${id}_0.jpg',
    );
  }
}