import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'comment_model.dart';

final commentServiceProvider = Provider<CommentSerice>((ref) {
  return CommentSerice(Dio());
});

class CommentSerice {
  final Dio _dio;

  CommentSerice(this._dio);

  Future<List<Comment>> getComments() async {
    try {
      final response =
          await _dio.get('http://jsonplaceholder.typicode.com/comments');
      final results = List<Map<String, dynamic>>.from(response.data);

      List<Comment> comments =
          results.map((data) => Comment.fromMap(data)).toList(growable: false);
      return comments;
    } on DioError catch (dioError) {
      throw dioError;
    }
  }
}
