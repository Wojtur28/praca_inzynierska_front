import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';
import 'package:praca_inzynierska_front/presentation/pages/rating_page.dart';

import '../../utils/game_status_translation.dart';
import 'game_details_page.dart';

class LibraryPage extends StatefulWidget {
  final Dio dio;

  const LibraryPage({
    super.key,
    required this.dio,
  });

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  bool isLoading = true;
  ModelLibrary? library;
  Map<String, SteamGameWithDetails> gameDetails = {};
  Set<String> uniqueStatuses = {'NOT_STARTED', 'IN_PROGRESS', 'COMPLETED', 'DROPPED'};
  String? selectedStatus;

  final Map<String, Color> statusColors = {
    'NOT_STARTED': Colors.grey,
    'IN_PROGRESS': Colors.blue,
    'COMPLETED': Colors.green,
    'DROPPED': Colors.red,
  };

  @override
  void initState() {
    super.initState();
    _loadLibrary();
  }

  Future<void> _loadLibrary() async {
    try {
      final libraryApi = LibraryApi(widget.dio, standardSerializers);
      final response = await libraryApi.getOrCreateLibraryForCurrentUser();

      setState(() {
        library = response.data;
      });

      if (library?.libraryItems != null) {
        final steamGameIds = library!.libraryItems!
            .map((item) => item.steamGame?.id)
            .whereType<String>()
            .toList();

        if (steamGameIds.isNotEmpty) {
          final steamGamesApi = SteamGamesApi(widget.dio, standardSerializers);
          final detailResponse = await steamGamesApi.getSteamGamesWithDetails(
            gameIds: BuiltList<String>(steamGameIds),
          );

          if (detailResponse.statusCode == 200 && detailResponse.data != null) {
            final details = detailResponse.data!;
            setState(() {
              gameDetails = {
                for (var game in details) game.id!: game,
              };
            });
          }
        }
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd pobierania biblioteki: $e')),
      );
    }
  }

  Future<void> _updateGameStatus(String libraryItemId, String newStatus) async {
    try {
      final updateLibraryItem = UpdateLibraryItem(
            (b) => b..gameStatus = UpdateLibraryItemGameStatusEnum.valueOf(newStatus),
      );
      final libraryApi = LibraryApi(widget.dio, standardSerializers);
      await libraryApi.updateLibraryItemStatus(
        libraryItemId: libraryItemId,
        updateLibraryItem: updateLibraryItem,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Status gry został zaktualizowany.')),
      );

      setState(() {
        final index = library!.libraryItems!.indexWhere(
              (item) => item.id == libraryItemId,
        );
        if (index != -1) {
          final updatedItem = library!.libraryItems![index].rebuild(
                (b) => b..gameStatus = LibraryItemGameStatusEnum.valueOf(newStatus),
          );
          library = library!.rebuild((b) => b..libraryItems[index] = updatedItem);
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd aktualizacji statusu gry: $e')),
      );
    }
  }

  Future<void> _deleteGame(String libraryItemId) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Usuń grę'),
        content: const Text('Czy na pewno chcesz usunąć tę grę z biblioteki?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Anuluj'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Usuń'),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    try {
      final libraryApi = LibraryApi(widget.dio, standardSerializers);
      await libraryApi.deleteLibraryItem(
        libraryItemId: libraryItemId,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gra została usunięta z biblioteki.')),
      );

      setState(() {
        library = library!.rebuild(
              (b) => b..libraryItems.removeWhere((item) => item.id == libraryItemId),
        );
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd usuwania gry: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (library == null) {
      return const Scaffold(
        body: Center(child: Text('Brak danych biblioteki')),
      );
    }

    List<LibraryItem> displayedItems = selectedStatus == null
        ? library!.libraryItems!.toList()
        : library!.libraryItems!.where((item) {
      return item.gameStatus.toString().split('.').last == selectedStatus;
    }).toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Container(
                width: 200,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Statusy',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          ListTile(
                            title: const Text('Wszystkie'),
                            selected: selectedStatus == null,
                            onTap: () {
                              setState(() {
                                selectedStatus = null;
                              });
                            },
                          ),
                          ...uniqueStatuses.map((status) {
                            return ListTile(
                              title: Text(gameStatusTranslation[status] ?? status),
                              selected: selectedStatus == status,
                              onTap: () {
                                setState(() {
                                  selectedStatus = status;
                                });
                              },
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: displayedItems.isEmpty
                  ? const Center(child: Text('Brak gier do wyświetlenia'))
                  : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 1200
                      ? 4
                      : MediaQuery.of(context).size.width > 800
                      ? 3
                      : 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemCount: displayedItems.length,
                itemBuilder: (context, index) {
                  final item = displayedItems[index];
                  final game = item.steamGame;
                  final detail = game != null ? gameDetails[game.id!] : null;
                  final imageUrl = detail?.headerImage ?? detail?.capsuleImage;
                  final status = item.gameStatus.toString().split('.').last;
                  final statusColor = statusColors[status] ?? Colors.grey;

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 120,
                              decoration: BoxDecoration(
                                color: statusColor.withOpacity(0.2),
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                child: imageUrl != null
                                    ? Image.network(
                                  imageUrl,
                                  width: double.infinity,
                                  height: 120,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Center(
                                      child: Icon(Icons.videogame_asset, size: 50, color: Colors.grey),
                                    );
                                  },
                                )
                                    : const Center(
                                  child: Icon(Icons.videogame_asset, size: 50, color: Colors.grey),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: CircleAvatar(
                                backgroundColor: Colors.white70,
                                child: IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    _deleteGame(item.id!);
                                  },
                                  tooltip: 'Usuń grę',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            game?.title ?? 'Brak tytułu',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Text(
                                'Status: ',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                gameStatusTranslation[status] ?? status,
                                style: TextStyle(fontSize: 14, color: statusColor),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          child: DropdownButton<String>(
                            value: status,
                            items: uniqueStatuses.map((status) {
                              return DropdownMenuItem<String>(
                                value: status,
                                child: Text(gameStatusTranslation[status] ?? status),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              if (newValue != null) {
                                _updateGameStatus(item.id!, newValue);
                              }
                            },
                            isExpanded: true,
                            underline: Container(),
                            icon: const Icon(Icons.arrow_drop_down),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
                                          gameId: game!.id!,
                                          onLogout: () async {
                                            Navigator.pushReplacementNamed(context, '/signin');
                                          },
                                          onThemeChange: (newTheme) {
                                          },
                                          currentTheme: ThemeMode.light,
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    elevation: 2,
                                    backgroundColor: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    'Recenzje',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => GameDetailsPage(
                                          dio: widget.dio,
                                          gameId: game!.id!,
                                          onLogout: () {},
                                          onThemeChange: (ThemeMode value) {},
                                          currentTheme: ThemeMode.light,
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    elevation: 2,
                                    backgroundColor: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    'Szczegóły',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
