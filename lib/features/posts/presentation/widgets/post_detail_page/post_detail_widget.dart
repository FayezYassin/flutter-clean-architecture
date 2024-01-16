
import 'package:flutter/material.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/domain/entities/posts.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/widgets/post_detail_page/delete_post_button_widget.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/widgets/post_detail_page/update_post_button_widget.dart';

class PostDetailWidget extends StatelessWidget {
  final Post post;

  PostDetailWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            post.title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            height: 50.0,
          ),
          Text(
            post.body,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UpdatePostButtonWidget(
                post: post,
              ),
              DeletePostButtonWidget(postId: post.id!),
            ],
          ),
        ],
      ),
    );
  }
}
