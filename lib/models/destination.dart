class Destination {
  final String id;
  final String name;
  final String location;
  final String description;
  final String imageUrl;
  final double rating;
  final int price;
  final String category;
  final List<String> galleries;
  final List<String> highlights;
  final List<String> moods;
  final bool isHiddenGem;
  final double latitude;
  final double longitude;

  const Destination({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.category,
    this.galleries = const [],
    this.highlights = const [],
    this.moods = const [],
    this.isHiddenGem = false,
    required this.latitude,
    required this.longitude,
  });
}

