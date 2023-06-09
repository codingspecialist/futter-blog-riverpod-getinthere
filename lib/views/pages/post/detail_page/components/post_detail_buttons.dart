import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_2/model/post/post.dart';
import 'package:flutter_blog_2/views/pages/post/list_page/post_list_view_model.dart';
import 'package:flutter_blog_2/views/pages/post/update_page/post_update_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailButtons extends ConsumerWidget {
  final Post post;

  const PostDetailButtons(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () async {
            ref.read(postListPageProvider.notifier).notifyRemove(post.id);
            Navigator.pop(context);
          },
          icon: const Icon(CupertinoIcons.delete),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => PostUpdatePage(post)));
          },
          icon: const Icon(CupertinoIcons.pen),
        ),
      ],
    );
  }
}
