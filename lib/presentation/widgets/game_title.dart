import 'package:flutter/material.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';

class GameTile extends StatelessWidget {
  final SteamGame game;

  const GameTile({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // W przyszłości możesz tutaj dodać np. obrazek: Image.network(gameImageUrl)
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder dla obrazka
            Container(
              height: 80,
              width: double.infinity,
              color: Colors.grey[300],
              child: const Center(child: Icon(Icons.image, size: 40)),
            ),
            const SizedBox(height: 8),
            Text(
              game.title ?? 'Brak tytułu',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text('Cena: ${game.launchPrice ?? 'brak'}'),
            Text('Recenzje: ${game.reviewsTotal ?? 0} (${game.reviewsScoreFancy ?? 'brak'})'),
          ],
        ),
      ),
    );
  }
}
