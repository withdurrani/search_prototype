import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_prototype/widgets/home_widgets/search_delegate.dart';

import '../../viewmodels/search_viewmodel.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            _Logo(),
            _TrailingWidgets(),
          ],
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 40,
      width: 60,
      child: Image(image: AssetImage('assets/logo.png')),
    );
  }
}

class _TrailingWidgets extends StatelessWidget {
  const _TrailingWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => _onSearchPressed(context),
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add_circle_outline_rounded),
        ),
        IconButton(
          onPressed: () {},
          icon: const _ProfilePic(),
        ),
      ],
    );
  }

  void _onSearchPressed(BuildContext context) async {
    final _history = context.read<SearchViewModel>().getSearchHistory();
    final result =
        await showSearch(context: context, delegate: Search(history: _history));
    if (result != null && result.toString().trim() != '') {
      context.read<SearchViewModel>().addToSeachHistory(result);
    }
  }
}

class _ProfilePic extends StatelessWidget {
  const _ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        CircleAvatar(backgroundImage: AssetImage('assets/profile.jpg')),
        Positioned(
          right: 0,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 4.5,
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 3,
            ),
          ),
        ),
      ],
    );
  }
}
