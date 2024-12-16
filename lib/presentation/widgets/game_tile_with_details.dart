import 'package:flutter/material.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';

class GameTileWithDetails extends StatelessWidget {
  final SteamGameWithDetails game;

  const GameTileWithDetails({Key? key, required this.game}) : super(key: key);

  String _formatReleaseDate(Date? date) {
    if (date == null) return 'N/A';

    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            if (game.headerImage != null && game.headerImage!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  game.headerImage!,
                  height: 215,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 120,
                      color: Colors.grey[300],
                      child: const Center(child: Icon(Icons.broken_image, size: 40)),
                    );
                  },
                ),
              )
            else
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Center(child: Icon(Icons.image, size: 40)),
              ),
            const SizedBox(height: 6),

            Text(
              game.title ?? 'Brak tytułu',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),

            Text(
              'Cena: ${game.launchPrice ?? 'N/A'}',
              style: const TextStyle(fontSize: 12),
            ),

            const SizedBox(height: 6),

            Text(
              'Developer: ${game.developer?.isNotEmpty == true ? game.developer : 'N/A'}',
              style: const TextStyle(fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            Text(
              'Publisher: ${game.publisher?.isNotEmpty == true ? game.publisher : 'N/A'}',
              style: const TextStyle(fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 6),

            Text(
              'Data wydania: ${_formatReleaseDate(game.releaseDate)}',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
