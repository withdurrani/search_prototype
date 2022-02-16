import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_prototype/models/post.dart';
import 'package:search_prototype/viewmodels/search_viewmodel.dart';
import 'package:search_prototype/widgets/home_widgets/search_bar.dart';
import '../../widgets/home_widgets/contest_card.dart';
import '../../widgets/home_widgets/post_card.dart';
import '../../widgets/home_widgets/survey_card.dart';
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
        child: _userHasSearched ? const _SearchScreen() : const _HomeScreen(),
      ),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TitleBar(),
        Expanded(child: Center(child: Text('Start searching!'))),
      ],
    );
  }
}

class _SearchScreen extends StatelessWidget {
  const _SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isSearching = context.select((SearchViewModel vm) => vm.isSearching);
    final _posts = context.select((SearchViewModel vm) => vm.getPosts);
    return Column(
      children: [
        const SearchBar(),
        _isSearching
            ? const Expanded(child: Center(child: CircularProgressIndicator()))
            : Expanded(
                child: _posts.isEmpty
                    ? const Center(child: Text('No posts to show here!'))
                    : ListView.builder(
                        padding: const EdgeInsets.only(top: 12),
                        itemCount: _posts.length,
                        itemBuilder: (context, index) {
                          final post = _posts[index];
                          return _CreateCard(post: post);
                        },
                      ),
              ),
      ],
    );
  }
}

class _CreateCard extends StatelessWidget {
  final Post post;
  const _CreateCard({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (post.postType) {
      case PostType.post:
        return PostCard(post: post);
      case PostType.survey:
        return SurveyCard(post: post);
      case PostType.contest:
        return ContestCard(post: post);
      case PostType.undefined:
        return Container();
    }
  }
}
