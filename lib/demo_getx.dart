import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'comments_list.dart';
import 'get_controller.dart';

class DemoGet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX'),
      ),
      body: SafeArea(
        child: GetXList(),
      ),
    );
  }
}

class GetXList extends StatelessWidget {
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
