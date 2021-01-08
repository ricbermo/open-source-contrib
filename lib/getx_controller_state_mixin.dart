import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'comment_model.dart';
import 'provider.dart';

class CommentsControllerMixin extends GetxController
    with StateMixin<List<Comment>> {
  final CommentSerice _service = CommentSerice(Dio());

  @override
  void onInit() {
    getComments();
    super.onInit();
  }

  void getComments() async {
    // var commentsList = await _service.getComments();
    _service.getComments().then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
