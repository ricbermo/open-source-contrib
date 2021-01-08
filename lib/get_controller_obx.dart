import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'comment_model.dart';
import 'provider.dart';

class CommentsControllerObx extends GetxController {
  final isLoading = false.obs;
  var comments = List<Comment>().obs;

  final CommentSerice _service = CommentSerice(Dio());

  @override
  void onInit() {
    getComments();
    super.onInit();
  }

  void getComments() async {
    isLoading.toggle();

    var commentsList = await _service.getComments();
    comments.addAll(commentsList);
    isLoading.toggle();
  }
}
