// lib/screens/summoner_page.dart
import 'package:flutter/material.dart';
import '../models/summoner.dart';
import '../services/riot_api.dart';

class SummonerSearchPage extends StatefulWidget {
  const SummonerSearchPage({super.key});

  @override
  State<SummonerSearchPage> createState() => _SummonerSearchPageState();
}

class _SummonerSearchPageState extends State<SummonerSearchPage> {
  final _controller = TextEditingController();
  Summoner? _summoner;
  bool _isLoading = false;
  String? _error;

  Future<void> _searchSummoner(String name) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final summoner = await RiotApi.getSummoner(name);
      setState(() {
        _summoner = summoner;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Summoner not found';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Summoner'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter summoner name',
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search, color: Colors.blue),
                  onPressed: () => _searchSummoner(_controller.text),
                ),
              ),
              style: const TextStyle(color: Colors.white),
              onSubmitted: _searchSummoner,
            ),
            const SizedBox(height: 20),
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_error != null)
              Text(_error!, style: const TextStyle(color: Colors.red))
            else if (_summoner != null)
                Card(
                  color: const Color(0xFF1E2328),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(_summoner!.profileIconUrl),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _summoner!.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Level ${_summoner!.summonerLevel}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}