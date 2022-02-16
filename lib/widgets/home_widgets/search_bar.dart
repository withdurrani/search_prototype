import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_prototype/viewmodels/search_viewmodel.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _searchString =
        context.select((SearchViewModel vm) => vm.searchString);
    return Row(
      children: [
        BackButton(
          onPressed: () => context.read<SearchViewModel>().clearSearch(),
        ),
        Expanded(child: Text(_searchString)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.tune)),
      ],
    );
  }
}
