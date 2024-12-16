import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';
import 'package:praca_inzynierska_front/domain/repositories/games_repository.dart';

import '../widgets/game_tile_with_details.dart';

class GamesPage extends StatefulWidget {
  final Dio dio;
  const GamesPage({super.key, required this.dio});

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  late GamesRepository _gamesRepository;
  BuiltList<SteamGameWithDetails> _games = BuiltList<SteamGameWithDetails>();
  bool _isLoading = false;
  bool _hasMore = true;
  int _currentPage = 0;
  final int _pageSize = 10;
  final _scrollController = ScrollController();
  String? _errorMessage;

  String? _selectedPlatform;
  final List<String> _platforms = ['PC', 'Xbox', 'PlayStation', 'Switch'];

  @override
  void initState() {
    super.initState();
    _gamesRepository = GamesRepository(widget.dio);
    _scrollController.addListener(_onScroll);
    _fetchGames();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      if (!_isLoading && _hasMore) {
        _currentPage++;
        _fetchGames();
      }
    }
  }

  Future<void> _fetchGames() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final newGames = await _gamesRepository.fetchGamesWithDetails(
        page: _currentPage,
        size: _pageSize,
        platform: _selectedPlatform,
      );
      print('Fetched ${newGames.length} games with details');
      setState(() {
        if (newGames.isEmpty) {
          _hasMore = false;
        } else {
          _games = _games.rebuild((b) => b..addAll(newGames));
        }
      });
      print('Total games now: ${_games.length}');
    } catch (e) {
      print('Error fetching games with details: $e');
      setState(() {
        _errorMessage = 'Błąd podczas pobierania gier z detalami';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _onPlatformChanged(String? newPlatform) {
    setState(() {
      _selectedPlatform = newPlatform;
      _games = BuiltList<SteamGameWithDetails>();
      _currentPage = 0;
      _hasMore = true;
    });
    _fetchGames();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final games = _games;
    print('Building UI with ${games.length} games with details');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Gier z Detalami'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [

            Row(
              children: [
                const Text('Platforma: '),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _selectedPlatform,
                    hint: const Text('Wybierz platformę'),
                    items: _platforms.map((platform) {
                      return DropdownMenuItem(
                        value: platform,
                        child: Text(platform),
                      );
                    }).toList(),
                    onChanged: _onPlatformChanged,
                  ),
                ),
                if (_selectedPlatform != null)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _onPlatformChanged(null);
                    },
                  ),
              ],
            ),
            const SizedBox(height: 10),
            if (_errorMessage != null)
              Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
            Expanded(
              child: GridView.builder(
                controller: _scrollController,
                itemCount: games.length + (_hasMore ? 1 : 0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  if (index == games.length) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final game = games[index];
                  return GameTileWithDetails(game: game);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
