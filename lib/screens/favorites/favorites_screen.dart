import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/favorites_provider.dart';
import '../../widgets/destination_card.dart';
import '../../widgets/empty_state.dart';
import '../detail/detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinasi Favorit'),
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, provider, _) {
          if (provider.favorites.isEmpty) {
            return const EmptyState(
              title: 'Belum Ada Favorit',
              subtitle: 'Simpan destinasi impianmu di sini agar mudah ditemukan kembali.',
              icon: Icons.favorite_outline,
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: provider.favorites.length,
            itemBuilder: (context, index) {
              final destination = provider.favorites[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: DestinationCard(
                  destination: destination,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(destination: destination),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
