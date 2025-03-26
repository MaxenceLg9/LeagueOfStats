// lib/screens/champion_details_page.dart
import 'package:flutter/material.dart';
import '../models/champion.dart';

class ChampionDetailsPage extends StatelessWidget {
  final Champion champion;

  const ChampionDetailsPage({super.key, required this.champion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(champion.name),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    champion.image,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    champion.title,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Lore',
                    style: TextStyle(
                      color: Color(0xFFC89B3C),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    champion.blurb,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}