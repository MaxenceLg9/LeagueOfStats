// lib/services/riot_api.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/champion.dart';
import '../models/summoner.dart';

class RiotApi {
  static String? _apiKey;
  static const String _baseUrl = 'https://euw1.api.riotgames.com';
  static const String _ddragonUrl = 'https://ddragon.leagueoflegends.com/cdn/13.24.1';

  static Future<void> initialize() async {
    await dotenv.load();
    _apiKey = dotenv.env['RIOT_API_KEY'];
  }

  static Future<Summoner> getSummoner(String name) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/lol/summoner/v4/summoners/by-name/$name'),
      headers: {'X-Riot-Token': _apiKey!},
    );

    if (response.statusCode == 200) {
      return Summoner.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load summoner');
    }
  }

  static Future<Map<String, Champion>> getChampions() async {
    final response = await http.get(
      Uri.parse('$_ddragonUrl/data/en_US/champion.json'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final Map<String, dynamic> champions = data['data'];
      return champions.map((id, champion) =>
          MapEntry(id, Champion.fromJson(id, champion)));
    } else {
      throw Exception('Failed to load champions');
    }
  }
}