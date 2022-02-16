import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_prototype/viewmodels/search_viewmodel.dart';
import 'package:search_prototype/widgets/home_widgets/search_bar.dart';

import '../../widgets/home_widgets/title_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userHasSearched =
        context.select((SearchViewModel vm) => vm.userHasSearched);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            _userHasSearched ? const SearchBar() : const TitleBar(),
          ],
        ),
      ),
    );
  }
}
