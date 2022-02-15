import 'package:flutter/material.dart';
import 'package:search_prototype/repositories/cohora_repository.dart';

class HomeViewModel with ChangeNotifier {
  final CohoraRepository repository;

  HomeViewModel({required this.repository});

  Future<void> search(String searchString) async {
    debugPrint('searched pressed');
    final result = await repository.search(searchString);
    debugPrint(result.toString());
  }
}
