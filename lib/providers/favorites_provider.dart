import 'package:flutter/material.dart';
import '../models/destination.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Destination> _favorites = [];

  List<Destination> get favorites => _favorites;

  void toggleFavorite(Destination destination) {
    final isExist = _favorites.any((item) => item.id == destination.id);
    if (isExist) {
      _favorites.removeWhere((item) => item.id == destination.id);
    } else {
      _favorites.add(destination);
    }
    notifyListeners();
  }

  bool isFavorite(Destination destination) {
    return _favorites.any((item) => item.id == destination.id);
  }
}
