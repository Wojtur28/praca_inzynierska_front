import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';
import 'package:praca_inzynierska_front/domain/repositories/games_repository.dart';
import '../../main.dart';
import '../pages/rating_page.dart';
import 'multi_select_chip.dart';


class GamesPageContent extends StatefulWidget {
  final Dio dio;
  final ValueNotifier<ThemeMode> themeNotifier;
  final dynamic authRepository;

  const GamesPageContent({
    super.key,
    required this.dio,
    required this.themeNotifier,
    required this.authRepository,
  });

  @override
  State<GamesPageContent> createState() => _GamesPageContentState();
}

class _GamesPageContentState extends State<GamesPageContent> {
  late GamesRepository _gamesRepository;
  late RecommendedGamesApi _recommendedGamesApi;
  List<SteamGameWithDetails> _games = [];
  List<SteamGame> _recommendedGames = [];
  bool _isLoading = false;
  bool _hasMore = true;
  bool _isRecommendedLoading = false;
  int _currentPage = 0;
  final int _pageSize = 10;
  final ScrollController _scrollController = ScrollController();

  String? _selectedPlatform;
  List<String> _selectedCategories = [];
  List<String> _selectedGenres = [];
  String _searchQuery = '';

  List<String> _platforms = [];
  List<String> _categories = [];
  List<String> _genres = [];

  bool _isFilterLoading = true;
  bool _isFilterError = false;

  @override
  void initState() {
    super.initState();
    _gamesRepository = GamesRepository(widget.dio);
    _recommendedGamesApi = RecommendedGamesApi(widget.dio, standardSerializers);
    _fetchAllFilters();
    _fetchGames();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 &&
        !_isLoading && _hasMore) {
      _currentPage++;
      _fetchGames();
    }
  }

  void _resetAndFetchGames() {
    setState(() {
      _games = [];
      _currentPage = 0;
      _hasMore = true;
    });
    _fetchGames();
  }

  Future<void> _addToLibrary(String steamGameId) async {
    try {
      final libraryItemApi = LibraryApi(widget.dio, standardSerializers);
      final createLibraryItem = CreateLibraryItem((b) => b
        ..steamGameId = steamGameId
        ..gameStatus = CreateLibraryItemGameStatusEnum.NOT_STARTED);
      await libraryItemApi.addLibraryItem(createLibraryItem: createLibraryItem);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Gra dodana do biblioteki')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Błąd podczas dodawania do biblioteki: $e')));
    }
  }

  Future<void> _fetchGames() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final List<SteamGameWithDetails> newGames = await _gamesRepository.fetchGamesWithDetails(
        page: _currentPage,
        size: _pageSize,
        platform: _selectedPlatform,
        categories: _selectedCategories.isNotEmpty ? _selectedCategories : null,
        genres: _selectedGenres.isNotEmpty ? _selectedGenres : null,
        search: _searchQuery.isNotEmpty ? _searchQuery : null,
      );
      setState(() {
        if (newGames.isEmpty) {
          _hasMore = false;
        } else {
          _games.addAll(newGames);
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Błąd podczas pobierania gier: $e')));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _fetchAllFilters() async {
    try {
      final categories = await _gamesRepository.fetchAllCategories();
      final genres = await _gamesRepository.fetchAllGenres();
      final platforms = await _gamesRepository.fetchAllPlatforms();
      setState(() {
        _categories = List.from(categories)..sort();
        _genres = List.from(genres)..sort();
        _platforms = List.from(platforms)..sort();
        _isFilterLoading = false;
      });
    } catch (e) {
      setState(() {
        _isFilterError = true;
        _isFilterLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Błąd podczas pobierania filtrów: $e')));
    }
  }

  Widget _buildFilterPanel() {
    return Drawer(
      child: Container(
        color: Colors.transparent,
        child: _isFilterLoading
            ? const Center(child: CircularProgressIndicator())
            : _isFilterError
            ? const Center(child: Text('Nie udało się załadować filtrów. Spróbuj ponownie.'))
            : ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Szukaj gier',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                _searchQuery = value;
                _resetAndFetchGames();
              },
            ),
            const SizedBox(height: 16),
            ExpansionTile(
              title: const Text('Platforma'),
              children: [
                DropdownButtonFormField<String>(
                  value: _selectedPlatform,
                  decoration: const InputDecoration(
                    labelText: 'Wybierz Platformę',
                    border: OutlineInputBorder(),
                  ),
                  items: _platforms
                      .map((platform) => DropdownMenuItem(value: platform, child: Text(platform)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedPlatform = value;
                      _resetAndFetchGames();
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            ExpansionTile(
              title: const Text('Kategorie'),
              children: [
                MultiSelectChip(
                  items: _categories,
                  initialSelected: _selectedCategories,
                  onSelectionChanged: (selectedList) {
                    setState(() {
                      _selectedCategories = selectedList;
                      _resetAndFetchGames();
                    });
                  },
                  label: 'Kategorie',
                ),
              ],
            ),
            const SizedBox(height: 16),
            ExpansionTile(
              title: const Text('Gatunki'),
              children: [
                MultiSelectChip(
                  items: _genres,
                  initialSelected: _selectedGenres,
                  onSelectionChanged: (selectedList) {
                    setState(() {
                      _selectedGenres = selectedList;
                      _resetAndFetchGames();
                    });
                  },
                  label: 'Gatunki',
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _selectedPlatform = null;
                  _selectedCategories.clear();
                  _selectedGenres.clear();
                  _searchQuery = '';
                  _resetAndFetchGames();
                });
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Resetuj filtry'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size.fromHeight(50),
                elevation: 8,
                backgroundColor: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameGrid() {
    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 1500
            ? 4
            : MediaQuery.of(context).size.width > 1200
            ? 3
            : MediaQuery.of(context).size.width > 800
            ? 2
            : 1,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemCount: _games.length + (_hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == _games.length) {
          return _isLoading ? const Center(child: CircularProgressIndicator()) : const SizedBox();
        }
        final game = _games[index];
        return _buildGameCard(game);
      },
    );
  }

  Widget _buildGameCard(SteamGameWithDetails game) {
    final List<String?> categories = game.categories?.map((c) => c.name).toList() ?? <String>[];
    final String categoriesText = categories.take(3).join(', ');
    final List<String?> genres = game.genres?.map((g) => g.name).toList() ?? <String>[];
    final String genresText = genres.take(3).join(', ');
    final List<String?> platformsList = game.platforms?.map((p) => p.name).toList() ?? <String>[];
    final String platformsText = platformsList.take(3).join(', ');
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  game.headerImage ?? '',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 50),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white70,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.library_add, size: 20, color: Colors.deepPurple),
                    onPressed: () => _addToLibrary(game.id!),
                    tooltip: 'Dodaj do biblioteki',
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  game.title ?? 'Brak tytułu',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text('Cena na premierę: \$${game.launchPrice ?? 'N/A'}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                const SizedBox(height: 12),
                if (categoriesText.isNotEmpty)
                  Text('Kategorie: $categoriesText',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                const SizedBox(height: 8),
                if (genresText.isNotEmpty)
                  Text('Gatunki: $genresText',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                const SizedBox(height: 8),
                if (platformsText.isNotEmpty)
                  Text('Platformy: $platformsText',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                const SizedBox(height: 12),
                _buildReviewSentiment(game),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RatingsPage(
                            dio: widget.dio,
                            gameId: game.id!,
                            onLogout: () async {
                              await widget.authRepository.logout();
                              isAdminNotifier.value = false;
                              Navigator.pushReplacementNamed(context, '/signin');
                            },
                            onThemeChange: (newTheme) {
                              widget.themeNotifier.value = newTheme;
                            },
                            currentTheme: widget.themeNotifier.value,
                            isLoggedIn: true,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      elevation: 4,
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Recenzje',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _showGameDetails(context, game);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      elevation: 4,
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Szczegóły',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewSentiment(SteamGameWithDetails game) {
    double? score = double.tryParse(game.reviewsScoreFancy ?? '');
    String sentiment = "Recenzje: ";
    Color color;
    if (score == null) {
      sentiment += 'Brak danych';
      color = Colors.grey;
    } else if (score < 0.4) {
      sentiment += 'Przytłaczająco negatywne';
      color = Colors.red;
    } else if (score < 0.6) {
      sentiment += 'Negatywne';
      color = Colors.orange;
    } else if (score < 0.8) {
      sentiment += 'Pozytywne';
      color = Colors.lightGreen;
    } else {
      sentiment += 'Przytłaczająco pozytywne';
      color = Colors.green;
    }
    return Row(
      children: [
        Icon(Icons.circle, color: color, size: 16),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            sentiment,
            style: TextStyle(color: color, fontSize: 14),
          ),
        ),
      ],
    );
  }

  void _showGameDetails(BuildContext context, SteamGameWithDetails game) {
    Navigator.pushNamed(context, '/game_details/${game.id}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MediaQuery.of(context).size.width <= 800
          ? _buildFilterPanel()
          : null,
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width > 800) _buildFilterPanel(),
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
