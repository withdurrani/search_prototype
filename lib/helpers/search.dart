import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/search_viewmodel.dart';
import '../widgets/home_widgets/search_delegate.dart';

class SearchHelper {
  void onSearchPressed(BuildContext context) async {
    final _history = context.read<SearchViewModel>().getSearchHistory;
    final result =
        await showSearch(context: context, delegate: Search(history: _history));
    if (result != null && result.toString().trim() != '') {
      context.read<SearchViewModel>().search(result);
    }
  }
}
