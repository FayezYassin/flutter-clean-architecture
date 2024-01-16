
import 'package:flutter/material.dart';
import 'package:flutter_cleanartchictor_examp/core/widgets/navigation.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/domain/entities/posts.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/pages/post_detail_page.dart';

class PostListWidget extends StatelessWidget {
  final List<Post> posts;

  const PostListWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => ListTile(
        leading: Text(posts[index].id.toString()),
        title: Text(
          posts[index].title.toString(),
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          posts[index].body,
          style: TextStyle(fontSize: 16.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
        onTap: () {
          navigateTo(context,PostDetailPage(post: posts[index]));
        },
      ),
      separatorBuilder: (context, index) => Divider(thickness: 1.0),
      itemCount: posts.length,
    );
  }
}
