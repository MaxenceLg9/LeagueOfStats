// lib/screens/champions_page.dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/champion.dart';
import '../services/riot_api.dart';

class ChampionsPage extends StatelessWidget {
  const ChampionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Champions'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<Map<String, Champion>>(
        future: RiotApi.getChampions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final champions = snapshot.data!.values.toList();
          return GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: champions.length,
            itemBuilder: (context, index) {
              final champion = champions[index];
              return Card(
                color: const Color(0xFF1E2328),
                child: Column(
                  children: [
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl: champion.image,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            champion.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            champion.title,
                            style: const TextStyle(color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}