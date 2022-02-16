import 'package:flutter/material.dart';
import 'package:search_prototype/helpers/search.dart';

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
          onPressed: () => SearchHelper()..onSearchPressed(context),
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
