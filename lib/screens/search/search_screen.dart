import 'package:flutter/material.dart';
import '../../data/destinations_data.dart';
import '../../models/destination.dart';
import '../../widgets/destination_card.dart';
import '../../widgets/empty_state.dart';
import '../detail/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  List<Destination> _searchResults = DestinationsData.allDestinations;

  void _onSearch(String query) {
    setState(() {
      _searchResults = DestinationsData.allDestinations
          .where((d) =>
              d.name.toLowerCase().contains(query.toLowerCase()) ||
              d.location.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Destinasi'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearch,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Cari nama tempat atau lokasi...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _onSearch('');
                        },
                      )
                    : null,
              ),
            ),
          ),
        ),
      ),
      body: _searchResults.isEmpty
          ? const EmptyState(
              title: 'Tidak Ditemukan',
              subtitle: 'Maaf, kami tidak menemukan destinasi yang Anda cari.',
              icon: Icons.search_off,
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: DestinationCard(
                    destination: _searchResults[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(destination: _searchResults[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
