
import 'package:flutter/material.dart';
import 'package:flutter_cleanartchictor_examp/core/widgets/navigation.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/domain/entities/posts.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/pages/post_add_update_page.dart';

class UpdatePostButtonWidget extends StatelessWidget {
  final Post post;

  const UpdatePostButtonWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        navigateTo(
          context,
          PostAddUpdatePage(
            isUpdatePost: true,
            post: post,
          ),
        );
      },
      icon: Icon(Icons.edit),
      label: Text("Edit"),
    );
  }
}
