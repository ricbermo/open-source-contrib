import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'comments_list.dart';
import 'get_controller.dart';
import 'get_controller_obx.dart';
import 'getx_controller_state_mixin.dart';

class DemoGet extends StatelessWidget {
  final controller = Get.put(CommentsControllerMixin());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX'),
      ),
      body: SafeArea(
        child: GetXMixin(),
      ),
    );
  }
}

class GetXBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GetBuilder<CommentsController>(
        init: CommentsController(),
        builder: (s) => s.isLoading
            ? const Center(child: CircularProgressIndicator())
            : CommentsList(comments: s.comments),
      ),
    );
  }
}

class GetxReactive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GetX<CommentsControllerObx>(
        init: CommentsControllerObx(),
        builder: (_) {
          return _.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CommentsList(
                  comments: _.comments,
                );
        },
      ),
    );
  }
}

class GetXMixin extends GetView<CommentsControllerMixin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: controller.obx(
        (state) => CommentsList(comments: controller.state),
        onLoading: Center(child: CircularProgressIndicator()),
        onError: (error) => Center(
          child: Text(
            error,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
