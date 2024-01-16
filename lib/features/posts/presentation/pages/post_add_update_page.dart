
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cleanartchictor_examp/core/util/snackbar_message.dart';
import 'package:flutter_cleanartchictor_examp/core/widgets/loading_widget.dart';
import 'package:flutter_cleanartchictor_examp/core/widgets/navigation.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/domain/entities/posts.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_state.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/pages/posts_page.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/widgets/post_add_update_page/form_widget.dart';

class PostAddUpdatePage extends StatelessWidget {
  final Post? post;
  final bool isUpdatePost;

  const PostAddUpdatePage({super.key, this.post, required this.isUpdatePost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() => AppBar(
        title: Text(isUpdatePost ? "Edit Post" : "Add Post"),
        centerTitle: true,
      );

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
          listener: (context, state) {
            if (state is MessageAddDeleteUpdatePostState) {
              SnackBarMessage().showSnackBar(
                  message: state.message,
                  context: context,
                  backColor: Colors.green);
              navigateAndRemoveUntil(context, PostsPage());
            } else if (state is ErrorAddDeleteUpdatePostState) {
              SnackBarMessage().showSnackBar(
                  message: state.message,
                  context: context,
                  backColor: Colors.red);
              navigateAndRemoveUntil(context, PostsPage());
            }
          },
          builder: (context, state) {
            if (state is LoadingAddDeleteUpdatePostState)
              return LoadingWidget();
            return FormWidget(
                isUpdatePost: isUpdatePost, post: isUpdatePost ? post : null);
          },
        ),
      ),
    );
  }
}
