// lib/screens/home_page.dart
import 'package:flutter/material.dart';
import 'champions_page.dart';
import 'summoner_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    HomeContent(),
    ChampionsPage(),
    SummonerSearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF091428),
        selectedItemColor: const Color(0xFFC89B3C),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Champions'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('League of Legends'),
            background: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/blt462f88b2c24d3128/5f4935878732f51d851a1b37/ss2020_urgot_03.jpg'
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
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
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FeaturedCard(),
                const SizedBox(height: 24),
                Text(
                  'Quick Access',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: const Color(0xFFC89B3C),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const QuickAccessGrid(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FeaturedCard extends StatelessWidget {
  const FeaturedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1E2328),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Featured Update',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: const Color(0xFFC89B3C),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Explore the latest patch notes and game updates',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC89B3C),
                foregroundColor: Colors.black,
              ),
              onPressed: () {},
              child: const Text('Learn More'),
            ),
          ],
        ),
      ),
    );
  }
}

class QuickAccessGrid extends StatelessWidget {
  const QuickAccessGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: const [
        QuickAccessCard(
          title: 'Champions',
          icon: Icons.people,
          color: Color(0xFF1E2328),
          index: 1,
        ),
        QuickAccessCard(
          title: 'Search Player',
          icon: Icons.search,
          color: Color(0xFF1E2328),
          index: 2,
        ),
        QuickAccessCard(
          title: 'News',
          icon: Icons.newspaper,
          color: Color(0xFF1E2328),
          index: 0,
        ),
        QuickAccessCard(
          title: 'Settings',
          icon: Icons.settings,
          color: Color(0xFF1E2328),
          index: 0,
        ),
      ],
    );
  }
}

class QuickAccessCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final int index;

  const QuickAccessCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: InkWell(
        onTap: () {
          if (index > 0) {
            final homeState = context.findAncestorStateOfType<_HomePageState>();
            if (homeState != null) {
              homeState.setState(() {
                homeState._currentIndex = index;
              });
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: const Color(0xFFC89B3C),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}