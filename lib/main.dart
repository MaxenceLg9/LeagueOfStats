// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'services/riot_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RiotApi.initialize();
  runApp(const LeagueApp());
}

class LeagueApp extends StatelessWidget {
  const LeagueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'League of Legends Guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF091428),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      home: const HomePage(),
    );
  }
}