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

  const GameDetailsPage({
    super.key,
    required this.dio,
    required this.gameId,
    required this.onLogout,
    required this.onThemeChange,
    required this.currentTheme,
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

  @override
  void initState() {
    super.initState();
    _fetchGameDetails();
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

  Widget _buildDetails() {
    if (_game == null || _gameDetail == null) {
      return const Center(child: Text('Nie znaleziono szczegółów gry.'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_gameDetail!.screenshots != null && _gameDetail!.screenshots!.isNotEmpty)
            LayoutBuilder(
              builder: (context, constraints) {
                double maxWidth = constraints.maxWidth * 0.8;
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    CarouselSlider(
                      items: _gameDetail!.screenshots!.map((screenshot) {
                        return Builder(
                          builder: (BuildContext context) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                width: maxWidth,
                                child: Image.network(
                                  screenshot.pathThumbnail!,
                                  fit: BoxFit.contain,
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
                        height: 300,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
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
                          tooltip: 'Poprzednia strona',
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
                          tooltip: 'Następna strona',
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          const SizedBox(height: 16),
          Text(
            _game!.title ?? 'Brak tytułu',
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            _gameDetail!.shortDescription ?? 'Brak opisu',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow('Cena na premierę:', '\$${_game!.launchPrice ?? 'N/A'}'),
                    if (_game!.releaseDate != null && _game!.releaseDate != 'N/A')
                      _buildDetailRow('Data wydania:', _formatDate(_game!.releaseDate)),
                    _buildDetailRow('Deweloper:', _gameDetail!.developer ?? 'N/A'),
                    _buildDetailRow('Wydawca:', _gameDetail!.publisher ?? 'N/A'),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTagList('Gatunki:', _gameDetail!.genres?.map((g) => g.name).cast<String>().toList()),
                    _buildTagList('Kategorie:', _gameDetail!.categories?.map((c) => c.name).cast<String>().toList()),
                    _buildTagList('Platformy:', _gameDetail!.platforms?.map((p) => p.name).cast<String>().toList()),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (_game!.steamPage != null)
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  _launchURL(_game!.steamPage!);
                },
                child: const Text('Przejdź na stronę Steam'),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title ',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTagList(String title, List<String>? items) {
    if (items == null || items.isEmpty) {
      return Text('$title Brak', style: const TextStyle(fontSize: 16));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: items.map((item) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(item, style: const TextStyle(fontSize: 14)),
            );
          }).toList(),
        ),
      ],
    );
  }

  String _formatDate(Object? date) {
    if (date is String) {
      return date;
    }
    return 'N/A';
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Nie można otworzyć URL: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      appBarTitle: 'Szczegóły gry',
      isAdmin: true,
      onLogout: widget.onLogout,
      onThemeChange: widget.onThemeChange,
      currentTheme: widget.currentTheme,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
        tooltip: 'Cofnij',
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
          ? Center(child: Text(_errorMessage!))
          : _buildDetails(),
    );
  }
}
