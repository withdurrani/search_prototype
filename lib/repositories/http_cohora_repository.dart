import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:search_prototype/models/post.dart';
import 'package:search_prototype/models/search_result.dart';
import 'package:search_prototype/repositories/cohora_repository.dart';
import 'package:http/http.dart' as http;

class HttpCohoraRepository implements CohoraRepository {
  final String api = 'https://apidev.cohora.net';
  final http.Client client = http.Client();

  @override
  Future<List<Post>> search(String searchString) async {
    //https://apidev.cohora.net/search/v1/search?query=test
    final searchApi = '$api/search/v1/search?query=$searchString';
    final response = await client.get(Uri.parse(searchApi));
    return compute(_parsePosts, response.body);
  }
}

List<Post> _parsePosts(String response) {
  final Map<String, dynamic> parsedJson =
      jsonDecode(response) as Map<String, dynamic>;
  final searchResult = SearchResult.fromJson(parsedJson);
  return searchResult.posts;
}
