import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/main_scaffold.dart';

class GameDetailsPage extends StatefulWidget {
  final Dio dio;
  final String gameId;
  final VoidCallback onLogout;
  final ValueChanged<ThemeMode> onThemeChange;
  final ThemeMode currentTheme;
  final bool isLoggedIn;

  const GameDetailsPage({
    super.key,
    required this.dio,
    required this.gameId,
    required this.onLogout,
    required this.onThemeChange,
    required this.currentTheme,
    required this.isLoggedIn,
  });

  @override
  State<GameDetailsPage> createState() => _GameDetailsPageState();
}

class _GameDetailsPageState extends State<GameDetailsPage> {
  final CarouselSliderController _carouselController = CarouselSliderController();
  SteamGame? _game;
  SteamGameDetail? _gameDetail;
  bool _isLoading = true;
  String? _errorMessage;
  DateTime? _viewStartTime;

  @override
  void initState() {
    super.initState();
    _viewStartTime = DateTime.now();
    _fetchGameDetails();
  }

  Future<void> _sendGameView() async {
    if (_viewStartTime == null || !widget.isLoggedIn) return;
    final duration = DateTime.now().difference(_viewStartTime!).inSeconds;
    final createGameView = CreateGameView((b) => b
      ..viewDuration = duration
      ..viewedAt = DateTime.now().toUtc());
    try {
      final gameViewsApi = GameViewsApi(widget.dio, standardSerializers);
      await gameViewsApi.createGameView(
        gameId: widget.gameId,
        createGameView: createGameView,
      );
    } catch (e) {
      print('Błąd podczas wysyłania danych o grze: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await _sendGameView();
        return true;
      },
      child: MainScaffold(
        appBarTitle: 'Szczegóły gry',
        isAdmin: true,
        onLogout: widget.onLogout,
        isLoggedIn: widget.isLoggedIn,
        onThemeChange: widget.onThemeChange,
        currentTheme: widget.currentTheme,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            await _sendGameView();
            Navigator.of(context).pop();
          },
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _errorMessage != null
            ? Center(child: Text(_errorMessage!))
            : _buildDetails(),
      ),
    );
  }

  Future<void> _fetchGameDetails() async {
    try {
      final steamGamesApi = SteamGamesApi(widget.dio, standardSerializers);
      final gameResponse = await steamGamesApi.getSteamGame(gameId: widget.gameId);
      final gameDetailResponse = await steamGamesApi.getSteamGameDetail(gameId: widget.gameId);
      setState(() {
        _game = gameResponse.data;
        _gameDetail = gameDetailResponse.data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Błąd podczas pobierania danych: $e';
        _isLoading = false;
      });
    }
  }

  Widget _buildGameTagsSection() {
    if (_game == null || _game!.tags == null || _game!.tags!.isEmpty) return const SizedBox.shrink();
    List<String> tags = _game!.tags!.split(',').map((t) => t.trim()).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Tagi", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const Divider(),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: tags.map((tag) => Chip(label: Text(tag))).toList(),
        ),
      ],
    );
  }

  Widget _buildDetails() {
    if (_game == null || _gameDetail == null) return const Center(child: Text('Nie znaleziono szczegółów gry.'));
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth > 800;
        return SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isWide ? 32 : 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (_gameDetail!.screenshots != null && _gameDetail!.screenshots!.isNotEmpty)
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CarouselSlider(
                              items: _gameDetail!.screenshots!.map((screenshot) {
                                return Builder(
                                  builder: (context) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: SizedBox(
                                        child: Image.network(
                                          screenshot.pathThumbnail!,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) =>
                                          const Icon(Icons.broken_image, size: 50),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                              carouselController: _carouselController,
                              options: CarouselOptions(
                                height: 400,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                viewportFraction: 0.7,
                                aspectRatio: 16 / 9,
                                enableInfiniteScroll: false,
                              ),
                            ),
                            Positioned(
                              left: 16,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_back, size: 32),
                                  color: Colors.deepPurple,
                                  onPressed: () => _carouselController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 16,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_forward, size: 32),
                                  color: Colors.deepPurple,
                                  onPressed: () => _carouselController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 24),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_game!.title ?? 'Brak tytułu',
                              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16),
                          Text(_gameDetail!.shortDescription ?? 'Brak opisu',
                              style: const TextStyle(fontSize: 18)),
                          const SizedBox(height: 24),
                          Text("Szczegóły",
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          const Divider(),
                          ListTile(
                            leading: const Icon(Icons.monetization_on, color: Colors.deepPurple),
                            title: Text('Cena na premierę: \$${_game!.launchPrice ?? 'N/A'}'),
                          ),
                          ListTile(
                            leading: const Icon(Icons.calendar_today, color: Colors.deepPurple),
                            title: Text(
                              'Data wydania: ${(_game!.releaseDate != null && _game!.releaseDate != 'N/A') ? _game!.releaseDate : 'Brak informacji'}',
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.developer_mode, color: Colors.deepPurple),
                            title: Text('Deweloper: ${_gameDetail!.developer ?? 'N/A'}'),
                          ),
                          ListTile(
                            leading: const Icon(Icons.business, color: Colors.deepPurple),
                            title: Text('Wydawca: ${_gameDetail!.publisher ?? 'N/A'}'),
                          ),
                          const SizedBox(height: 24),
                          _buildGameTagsSection(),
                          const SizedBox(height: 16),
                          Center(
                            child: ElevatedButton(
                              onPressed: () => _launchURL(_game!.steamPage!),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                                elevation: 4,
                                backgroundColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              child: const Text('Przejdź na stronę Steam'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Nie można otworzyć URL: $url';
    }
  }
}
