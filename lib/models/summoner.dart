// lib/models/summoner.dart
class Summoner {
  final String id;
  final String accountId;
  final String puuid;
  final String name;
  final int profileIconId;
  final int summonerLevel;

  Summoner({
    required this.id,
    required this.accountId,
    required this.puuid,
    required this.name,
    required this.profileIconId,
    required this.summonerLevel,
  });

  factory Summoner.fromJson(Map<String, dynamic> json) {
    return Summoner(
      id: json['id'],
      accountId: json['accountId'],
      puuid: json['puuid'],
      name: json['name'],
      profileIconId: json['profileIconId'],
      summonerLevel: json['summonerLevel'],
    );
  }

  String get profileIconUrl =>
      'https://ddragon.leagueoflegends.com/cdn/13.24.1/img/profileicon/$profileIconId.png';
}