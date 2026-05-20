import 'package:flutter/material.dart';
import '../../models/destination.dart';
import '../../theme/app_colors.dart';
import '../../widgets/rating_widget.dart';
import '../../widgets/price_tag.dart';
import '../booking/booking_screen.dart';

// Weather data classes
class WeatherInfo {
  final String condition;
  final double temp;
  final int humidity;
  final double windSpeed;
  final IconData icon;
  final Color iconColor;
  final List<ForecastDay> forecast;

  WeatherInfo({
    required this.condition,
    required this.temp,
    required this.humidity,
    required this.windSpeed,
    required this.icon,
    required this.iconColor,
    required this.forecast,
  });
}

class ForecastDay {
  final String dayName;
  final String condition;
  final double temp;
  final IconData icon;

  ForecastDay({
    required this.dayName,
    required this.condition,
    required this.temp,
    required this.icon,
  });
}

class DetailScreen extends StatelessWidget {
  final Destination destination;

  const DetailScreen({super.key, required this.destination});

  // Dynamically generates realistic weather data based on destination category
  WeatherInfo _getWeatherInfo(String category) {
    if (category == 'Pantai') {
      return WeatherInfo(
        condition: 'Cerah Berawan',
        temp: 31.0,
        humidity: 72,
        windSpeed: 14.5,
        icon: Icons.wb_sunny_outlined,
        iconColor: Colors.amber,
        forecast: [
          ForecastDay(dayName: 'Besok', condition: 'Cerah', temp: 32.0, icon: Icons.wb_sunny),
          ForecastDay(dayName: 'Lusa', condition: 'Hujan Ringan', temp: 29.0, icon: Icons.cloudy_snowing),
          ForecastDay(dayName: 'Hari ke-3', condition: 'Cerah Berawan', temp: 30.5, icon: Icons.wb_cloudy_outlined),
        ],
      );
    } else if (category == 'Gunung') {
      return WeatherInfo(
        condition: 'Kabut Berawan',
        temp: 17.5,
        humidity: 88,
        windSpeed: 8.2,
        icon: Icons.filter_drama_outlined,
        iconColor: Colors.lightBlueAccent,
        forecast: [
          ForecastDay(dayName: 'Besok', condition: 'Berawan', temp: 16.0, icon: Icons.cloud),
          ForecastDay(dayName: 'Lusa', condition: 'Cerah Berawan', temp: 19.0, icon: Icons.wb_cloudy),
          ForecastDay(dayName: 'Hari ke-3', condition: 'Hujan Dingin', temp: 15.0, icon: Icons.grain),
        ],
      );
    } else if (category == 'Danau') {
      return WeatherInfo(
        condition: 'Sejuk Berangin',
        temp: 23.8,
        humidity: 76,
        windSpeed: 18.0,
        icon: Icons.air_outlined,
        iconColor: Colors.tealAccent,
        forecast: [
          ForecastDay(dayName: 'Besok', condition: 'Cerah', temp: 25.0, icon: Icons.wb_sunny),
          ForecastDay(dayName: 'Lusa', condition: 'Berawan', temp: 23.0, icon: Icons.cloud),
          ForecastDay(dayName: 'Hari ke-3', condition: 'Gerimis', temp: 22.5, icon: Icons.grain),
        ],
      );
    } else {
      // Budaya
      return WeatherInfo(
        condition: 'Cerah Nyaman',
        temp: 27.2,
        humidity: 62,
        windSpeed: 9.5,
        icon: Icons.wb_cloudy_outlined,
        iconColor: Colors.orangeAccent,
        forecast: [
          ForecastDay(dayName: 'Besok', condition: 'Cerah', temp: 28.5, icon: Icons.wb_sunny),
          ForecastDay(dayName: 'Lusa', condition: 'Cerah Berawan', temp: 27.0, icon: Icons.wb_cloudy),
          ForecastDay(dayName: 'Hari ke-3', condition: 'Berawan', temp: 26.5, icon: Icons.cloud),
        ],
      );
    }
  }

  Widget _buildWeatherDetailItem(IconData icon, String value, String label) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.primaryLight),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.textHint,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final weather = _getWeatherInfo(destination.category);

    return Scaffold(
      body: Stack(
        children: [
          // Hero Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Hero(
              tag: 'dest-${destination.id}',
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(destination.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: AppColors.overlayGradient,
                  ),
                ),
              ),
            ),
          ),

          // App Bar Buttons
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black38,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black38,
                    child: IconButton(
                      icon: const Icon(Icons.favorite_border, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Handle
                      Center(
                        child: Container(
                          width: 60,
                          height: 5,
                          decoration: BoxDecoration(
                            color: AppColors.surfaceLight,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Title & Location
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  destination.name,
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on, size: 16, color: AppColors.primaryLight),
                                    const SizedBox(width: 4),
                                    Text(
                                      destination.location,
                                      style: const TextStyle(color: AppColors.textSecondary),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          RatingWidget(rating: destination.rating, iconSize: 20),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Description
                      const Text(
                        'Deskripsi',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        destination.description,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          height: 1.6,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Weather Check Card
                      const Text(
                        'Informasi Cuaca Saat Ini ⛅',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.surfaceLight, width: 1.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(weather.icon, size: 40, color: weather.iconColor),
                                    const SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          weather.condition,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.textPrimary,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        const Text(
                                          'Prakiraan lokal real-time',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: AppColors.textHint,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  '${weather.temp.toStringAsFixed(1)}°C',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            const Divider(color: AppColors.surfaceLight, height: 1, thickness: 1),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildWeatherDetailItem(Icons.water_drop_outlined, '${weather.humidity}%', 'Kelembaban'),
                                _buildWeatherDetailItem(Icons.wind_power_outlined, '${weather.windSpeed} km/h', 'Kecepatan Angin'),
                              ],
                            ),
                            const SizedBox(height: 20),
                            // 3-Day Forecast Section
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Prakiraan 3 Hari Ke Depan',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textSecondary.withOpacity(0.9),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: weather.forecast.map((f) {
                                return Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 4),
                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: AppColors.surfaceLight.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: AppColors.surfaceLight.withOpacity(0.8)),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          f.dayName,
                                          style: const TextStyle(
                                            fontSize: 11,
                                            color: AppColors.textSecondary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Icon(f.icon, size: 20, color: weather.iconColor),
                                        const SizedBox(height: 6),
                                        Text(
                                          '${f.temp.toStringAsFixed(0)}°C',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.textPrimary,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          f.condition,
                                          style: const TextStyle(
                                            fontSize: 8,
                                            color: AppColors.textHint,
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Highlights
                      if (destination.highlights.isNotEmpty) ...[
                        const Text(
                          'Fasilitas & Sorotan',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: destination.highlights.map((h) {
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColors.surface,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppColors.surfaceLight),
                              ),
                              child: Text(
                                h,
                                style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 24),
                      ],

                      // Gallery placeholder
                      const Text(
                        'Galeri',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: destination.galleries.isNotEmpty ? destination.galleries.length : 1,
                          itemBuilder: (context, index) {
                            final imageUrl = destination.galleries.isNotEmpty ? destination.galleries[index] : destination.imageUrl;
                            return Container(
                              width: 100,
                              margin: const EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppColors.surface,
                                image: DecorationImage(
                                  image: NetworkImage(imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 120), // Bottom spacing for FAB
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Harga Estimasi',
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
                  ),
                  PriceTag(price: destination.price, fontSize: 24),
                ],
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingScreen(destination: destination),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Book Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
