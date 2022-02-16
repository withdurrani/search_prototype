import 'package:flutter/material.dart';
import 'package:search_prototype/repositories/cohora_repository.dart';

import '../models/post.dart';

class SearchViewModel with ChangeNotifier {
  final CohoraRepository repository;

  SearchViewModel({required this.repository});

  //======== Private Variables ========
  final List<String> _searchHistory = ['Red Bull', 'Red Bull T-Shirt'];
  String _searchString = '';
  bool _isSearching = false;
  List<Post> _posts = [];

  //======== Getters ========
  bool get isSearching => _isSearching;
  String get searchString => _searchString;
  List<String> get getSearchHistory => _searchHistory;
  bool get userHasSearched => _searchString.trim() != '';
  List<Post> get getPosts => _posts;

  //======== Private Methods ========
  void _addToSeachHistory(String text) {
    _searchString = text;
    if (text.trim() != '' && !_searchHistory.contains(text)) {
      _searchHistory.add(text);
    }
  }

  //======== Public Methods ========
  void clearSearch() {
    _searchString = '';
    notifyListeners();
  }

  Future<void> search(String searchString) async {
    _isSearching = true;
    notifyListeners();
    try {
      _addToSeachHistory(searchString);
      _posts = await repository.search(searchString);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      _isSearching = false;
      notifyListeners();
    }
  }
}
