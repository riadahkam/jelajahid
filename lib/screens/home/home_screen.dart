import 'package:flutter/material.dart';
import '../../data/destinations_data.dart';
import '../../models/destination.dart';
import '../../theme/app_colors.dart';
import '../../widgets/banner_carousel.dart';
import '../../widgets/category_chips.dart';
import '../../widgets/destination_card.dart';
import '../detail/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'Semua';
  final List<String> _categories = ['Semua', 'Pantai', 'Gunung', 'Budaya', 'Danau'];

  List<Destination> get _filteredDestinations {
    if (_selectedCategory == 'Semua') {
      return DestinationsData.allDestinations;
    }
    return DestinationsData.allDestinations
        .where((d) => d.category == _selectedCategory)
        .toList();
  }

  void _navigateToDetail(Destination destination) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(destination: destination),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Halo, Traveler!',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Jelajahi Indonesia',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.surface,
                      child: IconButton(
                        icon: const Icon(Icons.notifications_outlined),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),

              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  readOnly: true,
                  onTap: () {
                    // Navigate to search tab if needed or open search
                  },
                  decoration: InputDecoration(
                    hintText: 'Cari destinasi impianmu...',
                    prefixIcon: const Icon(Icons.search, color: AppColors.textHint),
                    suffixIcon: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.tune, color: Colors.white, size: 20),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Banner Carousel
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Destinasi Populer',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              BannerCarousel(
                destinations: DestinationsData.allDestinations.take(3).toList(),
                onTap: _navigateToDetail,
              ),

              const SizedBox(height: 24),

              // Categories
              CategoryChips(
                categories: _categories,
                onSelected: (category) {
                  setState(() {
                    _selectedCategory = category;
                  });
                },
              ),

              const SizedBox(height: 16),

              // Destination List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _filteredDestinations.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: DestinationCard(
                        destination: _filteredDestinations[index],
                        onTap: () => _navigateToDetail(_filteredDestinations[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
