import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';

class RecommendedGame {
  final SteamGame game;
  final SteamGameDetail detail;

  RecommendedGame({required this.game, required this.detail});
}

class RecommendedGamesPage extends StatefulWidget {
  final Dio dio;
  final ValueNotifier<ThemeMode> themeNotifier;
  final dynamic authRepository;

  const RecommendedGamesPage({
    super.key,
    required this.dio,
    required this.themeNotifier,
    required this.authRepository,
  });

  @override
  State<RecommendedGamesPage> createState() => _RecommendedGamesPageState();
}

class _RecommendedGamesPageState extends State<RecommendedGamesPage> {
  late RecommendedGamesApi _recommendedGamesApi;
  List<RecommendedGame> _recommendedGames = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _recommendedGamesApi = RecommendedGamesApi(widget.dio, standardSerializers);
    _fetchRecommendedGames();
  }

  Future<void> _fetchRecommendedGames() async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
    });
    try {
      final Response<BuiltList<SteamGame>> response = await _recommendedGamesApi.getRecommendedGames();
      final recommendedList = response.data?.toList() ?? [];
      final steamGamesApi = SteamGamesApi(widget.dio, standardSerializers);
      final List<RecommendedGame> tempList = await Future.wait(recommendedList.map((game) async {
        final detailResponse = await steamGamesApi.getSteamGameDetail(gameId: game.id!);
        return RecommendedGame(game: game, detail: detailResponse.data!);
      }));
      if (!mounted) return;
      setState(() {
        _recommendedGames = tempList;
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd podczas pobierania rekomendowanych gier: $e')),
      );
    } finally {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildGameCard(RecommendedGame recommendedGame) {
    final game = recommendedGame.game;
    final detail = recommendedGame.detail;
    final categoriesText = detail.categories != null
        ? detail.categories!.map((c) => c.name).join(', ')
        : '';
    final genresText = detail.genres != null
        ? detail.genres!.map((g) => g.name).join(', ')
        : '';
    final platformsText = detail.platforms != null
        ? detail.platforms!.map((p) => p.name).join(', ')
        : '';
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/game_details/${game.id}');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                detail.headerImage ?? '',
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, size: 50),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                game.title ?? 'Brak tytułu',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (categoriesText.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Kategorie: $categoriesText',
                  style: const TextStyle(fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            if (genresText.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Gatunki: $genresText',
                  style: const TextStyle(fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            if (platformsText.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Text(
                  'Platformy: $platformsText',
                  style: const TextStyle(fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MediaQuery.of(context).size.width <= 800
          ? Drawer(
        child: ListView(
          children: [
            Container(
              height: 56,
              decoration: const BoxDecoration(color: Colors.deepPurple),
              child: const Center(
                child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.star, color: Colors.deepPurple),
              title: const Text('Rekomendacje'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/recommendations');
              },
            ),
            ListTile(
              leading: const Icon(Icons.videogame_asset, color: Colors.deepPurple),
              title: const Text('Gry'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/games');
              },
            ),
          ],
        ),
      )
          : null,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _recommendedGames.isEmpty
          ? const Center(child: Text("Brak rekomendacji"))
          : GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 1500
              ? 6
              : MediaQuery.of(context).size.width > 1200
              ? 4
              : MediaQuery.of(context).size.width > 800
              ? 3
              : 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemCount: _recommendedGames.length,
        itemBuilder: (context, index) {
          final recommendedGame = _recommendedGames[index];
          return _buildGameCard(recommendedGame);
        },
      ),
    );
  }
}
