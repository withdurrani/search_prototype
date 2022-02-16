import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final List<String> history;
  Search({required this.history});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => close(context, query),
        icon: const Icon(Icons.search),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent', style: Theme.of(context).textTheme.subtitle2),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            children: history
                .where((history) =>
                    history.toLowerCase().startsWith(query.toLowerCase()))
                .map((history) => GestureDetector(
                    onTap: () {
                      query = history;
                      close(context, query);
                    },
                    child: _HistoryItem(history: history)))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _HistoryItem extends StatelessWidget {
  const _HistoryItem({required this.history, Key? key}) : super(key: key);

  final String history;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 80,
      child: Column(
        children: [
          const CircleAvatar(backgroundColor: Colors.amber),
          const SizedBox(height: 10),
          Text(history, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
