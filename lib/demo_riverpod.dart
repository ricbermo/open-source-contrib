import 'package:demo/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

import 'comment_model.dart';

class DemoRiverpod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Riverpod'),
        ),
        body: SafeArea(
          child: RiverpodList(),
        ),
      ),
    );
  }
}

final commentsFutureProvider =
    FutureProvider.autoDispose<List<Comment>>((ref) async {
  ref.maintainState = true;

  final _service = ref.watch(commentServiceProvider);
  final c = await _service.getComments();
  return c;
});

class RiverpodList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      child: watch(commentsFutureProvider).when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(
          child: Text(
            e.toString(),
          ),
        ),
        data: (comments) {
          return RefreshIndicator(
            onRefresh: () => context.refresh(commentsFutureProvider),
            child: ListView.separated(
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
            ),
          );
        },
      ),
    );
  }
}
