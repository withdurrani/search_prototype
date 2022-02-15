import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_prototype/viewmodels/home_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              context.read<HomeViewModel>().search('test');
            },
            child: const Text('Search')),
      ),
    );
  }
}
