class FavoritesManager {
  static final List<Map<String, String>> _favorites = [];

  static List<Map<String, String>> get favorites => _favorites;

  static void toggleFavorite(Map<String, String> room) {
    final existingIndex = _favorites.indexWhere((item) => item['title'] == room['title']);
    if (existingIndex >= 0) {
      _favorites.removeAt(existingIndex);
    } else {
      _favorites.add(room);
    }
  }

  static bool isFavorite(String title) {
    return _favorites.any((item) => item['title'] == title);
  }
}
