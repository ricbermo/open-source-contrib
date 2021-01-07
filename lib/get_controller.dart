import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'comment_model.dart';
import 'provider.dart';

class CommentsController extends GetxController {
  List<Comment> comments = [];
  bool isLoading = false;
  final CommentSerice _service = CommentSerice(Dio());

  @override
  void onInit() {
    getComments();
    super.onInit();
  }

  void getComments() async {
    isLoading = true;
    update();
    var commentsList = await _service.getComments();
    comments = commentsList;
    isLoading = false;
    update();
  }
}
