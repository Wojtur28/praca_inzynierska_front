import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:built_collection/built_collection.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';
import 'package:praca_inzynierska_front/domain/repositories/games_repository.dart';

import 'filter_options.dart';

class GamesPage extends StatefulWidget {
  final Dio dio;
  final ValueNotifier<ThemeMode> themeNotifier;

  const GamesPage({Key? key, required this.dio, required this.themeNotifier}) : super(key: key);

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
  final ScrollController _scrollController = ScrollController();

  String? _selectedPlatform;
  List<String> _selectedCategories = [];
  List<String> _selectedGenres = [];

  @override
  void initState() {
    super.initState();
    _gamesRepository = GamesRepository(widget.dio);
    _fetchGames();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
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
        categories: _selectedCategories.isNotEmpty ? _selectedCategories : null,
        genres: _selectedGenres.isNotEmpty ? _selectedGenres : null,
      );
      setState(() {
        if (newGames.isEmpty) {
          _hasMore = false;
        } else {
          _games = _games.rebuild((b) => b..addAll(newGames));
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd podczas pobierania gier: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildFilterBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(
          color: Theme.of(context).colorScheme.onBackground,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Szukaj gier',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) async {
              if (value.isNotEmpty) {
                final suggestions = await _gamesRepository.fetchGamesWithDetails(
                  search: value,
                );
                setState(() {
                  _games = BuiltList<SteamGameWithDetails>(suggestions);
                });
              } else {
                setState(() {
                  _games = BuiltList<SteamGameWithDetails>();
                  _fetchGames();
                });
              }
            },
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              DropdownButton<String>(
                value: _selectedPlatform,
                hint: const Text('Platforma'),
                items: platforms.map((platform) {
                  return DropdownMenuItem(value: platform, child: Text(platform));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedPlatform = value;
                    _games = BuiltList<SteamGameWithDetails>();
                    _currentPage = 0;
                    _hasMore = true;
                    _fetchGames();
                  });
                },
              ),
              DropdownButton<String>(
                value: _selectedCategories.isNotEmpty ? _selectedCategories.first : null,
                hint: const Text('Kategoria'),
                items: allCategories.map((category) {
                  return DropdownMenuItem(value: category, child: Text(category));
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedCategories = [value];
                      _games = BuiltList<SteamGameWithDetails>();
                      _currentPage = 0;
                      _hasMore = true;
                      _fetchGames();
                    });
                  }
                },
              ),
              DropdownButton<String>(
                value: _selectedGenres.isNotEmpty ? _selectedGenres.first : null,
                hint: const Text('Gatunek'),
                items: allGenres.map((genre) {
                  return DropdownMenuItem(value: genre, child: Text(genre));
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedGenres = [value];
                      _games = BuiltList<SteamGameWithDetails>();
                      _currentPage = 0;
                      _hasMore = true;
                      _fetchGames();
                    });
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedPlatform = null;
                    _selectedCategories.clear();
                    _selectedGenres.clear();
                    _games = BuiltList<SteamGameWithDetails>();
                    _currentPage = 0;
                    _hasMore = true;
                    _fetchGames();
                  });
                },
                child: const Text('Resetuj filtry'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGameGrid() {
    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.5,
      ),
      itemCount: _games.length + (_hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == _games.length) {
          return _isLoading
              ? const Center(child: CircularProgressIndicator())
              : const SizedBox();
        }
        final game = _games[index];
        return _buildGameCard(game);
      },
    );
  }

  Widget _buildGameCard(SteamGameWithDetails game) {
    final categories = (game.categories?.map((c) => c.name).toList() ?? []).take(2).toList();
    final genres = (game.genres?.map((g) => g.name).toList() ?? []).take(2).toList();

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              game.headerImage ?? '',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.broken_image,
                size: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  game.title ?? 'Brak tytułu',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text('Cena: \$${game.launchPrice ?? 'N/A'}',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                Text(
                  'Kategorie: ${categories.join(', ')}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.visible,
                ),
                Text(
                  'Gatunki: ${genres.join(', ')}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gry'),
        actions: [
          IconButton(
            icon: Icon(widget.themeNotifier.value == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode),
            onPressed: () {
              widget.themeNotifier.value =
              widget.themeNotifier.value == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFilterBar(),
          Expanded(
            child: _games.isEmpty && !_isLoading
                ? const Center(child: Text('Brak wyników'))
                : _buildGameGrid(),
          ),
        ],
      ),
    );
  }
}
