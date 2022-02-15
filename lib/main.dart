import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_prototype/repositories/http_cohora_repository.dart';
import 'package:search_prototype/viewmodels/home_viewmodel.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Prototype',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => HomeViewModel(repository: HttpCohoraRepository()),
        builder: (context, _) => const HomePage(),
      ),
    );
  }
}
