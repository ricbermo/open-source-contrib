import 'package:flutter/material.dart';
import 'comment_model.dart';

class CommentsList extends StatelessWidget {
  final List<Comment> comments;
  const CommentsList({
    Key key,
    this.comments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (c, i) => const Divider(),
      itemCount: comments?.length,
      itemBuilder: (ctx, index) {
        var comment = comments[index];
        return Container(
          padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
          child: Text(
            comment.body,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        );
      },
    );
  }
}
