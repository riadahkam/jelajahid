import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../data/destinations_data.dart';
import '../../models/destination.dart';
import '../../theme/app_colors.dart';
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
  String _searchQuery = '';
  
  // Filters & Sorting state
  bool _onlyHiddenGems = false;
  String _sortBy = 'rekomendasi'; // 'rekomendasi', 'terdekat', 'terjauh'
  
  // Mock current user location (Jakarta)
  final double _userLat = -6.200000;
  final double _userLng = 106.816666;

  // Haversine formula to calculate distance in km
  double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double p = 0.017453292519943295; // Pi / 180
    final double a = 0.5 - math.cos((lat2 - lat1) * p) / 2 +
        math.cos(lat1 * p) * math.cos(lat2 * p) *
            (1 - math.cos((lon2 - lon1) * p)) / 2;
    return 12742 * math.asin(math.sqrt(a)); // 2 * R; R = 6371 km
  }

  List<Destination> get _filteredAndSortedResults {
    // 1. Filter based on query
    List<Destination> results = DestinationsData.allDestinations.where((d) {
      final matchesQuery = d.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          d.location.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          d.category.toLowerCase().contains(_searchQuery.toLowerCase());
      
      final matchesHiddenGem = !_onlyHiddenGems || d.isHiddenGem;
      
      return matchesQuery && matchesHiddenGem;
    }).toList();

    // 2. Sort based on selection
    if (_sortBy == 'terdekat') {
      results.sort((a, b) {
        final distA = _calculateDistance(_userLat, _userLng, a.latitude, a.longitude);
        final distB = _calculateDistance(_userLat, _userLng, b.latitude, b.longitude);
        return distA.compareTo(distB);
      });
    } else if (_sortBy == 'terjauh') {
      results.sort((a, b) {
        final distA = _calculateDistance(_userLat, _userLng, a.latitude, a.longitude);
        final distB = _calculateDistance(_userLat, _userLng, b.latitude, b.longitude);
        return distB.compareTo(distA);
      });
    } else {
      // Sort by rating (rekomendasi)
      results.sort((a, b) => b.rating.compareTo(a.rating));
    }

    return results;
  }

  void _onSearch(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    final results = _filteredAndSortedResults;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cari Destinasi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Input Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: _searchController,
                onChanged: _onSearch,
                decoration: InputDecoration(
                  hintText: 'Cari nama tempat, kota, atau kategori...',
                  prefixIcon: const Icon(Icons.search, color: AppColors.textHint),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, color: AppColors.textHint),
                          onPressed: () {
                            _searchController.clear();
                            _onSearch('');
                          },
                        )
                      : null,
                ),
              ),
            ),

            // Premium Filter & Sort Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hidden Gem Toggle & Location badge
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.my_location, size: 14, color: AppColors.primaryLight),
                          const SizedBox(width: 4),
                          Text(
                            'Lokasi Anda: Jakarta',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary.withOpacity(0.8),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      // Toggle Hidden Gems
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _onlyHiddenGems = !_onlyHiddenGems;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            gradient: _onlyHiddenGems
                                ? const LinearGradient(
                                    colors: [Color(0xFFE5A93C), Color(0xFFC5871B)],
                                  )
                                : null,
                            color: _onlyHiddenGems ? null : AppColors.surface,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: _onlyHiddenGems ? Colors.transparent : AppColors.surfaceLight,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.auto_awesome,
                                size: 12,
                                color: _onlyHiddenGems ? Colors.white : AppColors.accent,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Hidden Gems ✨',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: _onlyHiddenGems ? Colors.white : AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Sort selector chips
                  Row(
                    children: [
                      const Text(
                        'Urutan:',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildSortChip('rekomendasi', '⭐ Rekomendasi'),
                              const SizedBox(width: 8),
                              _buildSortChip('terdekat', '📍 Terdekat'),
                              const SizedBox(width: 8),
                              _buildSortChip('terjauh', '🗺️ Terjauh'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const Divider(color: AppColors.surfaceLight, thickness: 1, height: 16),

            // Search Results List
            Expanded(
              child: results.isEmpty
                  ? const EmptyState(
                      title: 'Tidak Ditemukan',
                      subtitle: 'Maaf, kami tidak menemukan destinasi tersembunyi yang Anda cari.',
                      icon: Icons.search_off,
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                      itemCount: results.length,
                      itemBuilder: (context, index) {
                        final destination = results[index];
                        final distance = _calculateDistance(
                          _userLat,
                          _userLng,
                          destination.latitude,
                          destination.longitude,
                        );
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: DestinationCard(
                            destination: destination,
                            displayDistance: distance,
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
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSortChip(String value, String label) {
    final isSelected = _sortBy == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _sortBy = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.15) : AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.surfaceLight,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? AppColors.primary : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
