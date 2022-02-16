import 'package:flutter/material.dart';
import 'package:search_prototype/repositories/cohora_repository.dart';

class SearchViewModel with ChangeNotifier {
  final CohoraRepository repository;

  SearchViewModel({required this.repository});

  final List<String> _searchHistory = ['Red Bull', 'Red Bull T-Shirt'];
  String _searchString = '';

  String get searchString => _searchString;
  List<String> getSearchHistory() => _searchHistory;
  bool get userHasSearched => _searchString.trim() != '';

  void addToSeachHistory(String text) {
    _searchString = text;
    if (text.trim() != '' && !_searchHistory.contains(text)) {
      _searchHistory.add(text);
    }
    notifyListeners();
  }

  void clearSearch() {
    _searchString = '';
    notifyListeners();
  }

  Future<void> search(String searchString) async {
    final result = await repository.search(searchString);
  }
}
