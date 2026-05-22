import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  // --- FAVORITE ---
  final Set<String> _favorites = {};

  bool isFavorite(String title) => _favorites.contains(title);

  void toggleFavorite(String title) {
    if (_favorites.contains(title)) {
      _favorites.remove(title);
    } else {
      _favorites.add(title);
    }
    notifyListeners();
  }

  // --- SELECTED CATEGORY ---
  String _selectedCategory = '';

  String get selectedCategory => _selectedCategory;

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  // --- CART ---
  final List<String> _cart = [];

  List<String> get cart => _cart;

  int get cartCount => _cart.length;

  void addToCart(String title) {
    _cart.add(title);
    notifyListeners();
  }

  void removeFromCart(String title) {
    _cart.remove(title);
    notifyListeners();
  }

  bool isInCart(String title) => _cart.contains(title);
}