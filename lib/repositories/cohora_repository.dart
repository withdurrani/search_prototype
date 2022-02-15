import '../models/post.dart';

abstract class CohoraRepository {
  Future<List<Post>> search(String searchString);
}
