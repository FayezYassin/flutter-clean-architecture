
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cleanartchictor_examp/core/util/snackbar_message.dart';
import 'package:flutter_cleanartchictor_examp/core/widgets/loading_widget.dart';
import 'package:flutter_cleanartchictor_examp/core/widgets/navigation.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_state.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/pages/posts_page.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/widgets/post_detail_page/delete_dialog_widget.dart';

class DeletePostButtonWidget extends StatelessWidget {
  final int postId;

  DeletePostButtonWidget({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => deleteDialog(context, postId),
      icon: Icon(Icons.delete_outline),
      label: Text("Delete"),
    );
  }

  void deleteDialog(context, int postId) {
    showDialog(
      context: context,
      builder: (context) {
        return BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
          listener: (context, state) {
            if (state is MessageAddDeleteUpdatePostState) {
              SnackBarMessage().showSnackBar(
                message: state.message,
                context: context,
                backColor: Colors.green,
              );
              navigateAndRemoveUntil(context, PostsPage());
            } else if (state is ErrorAddDeleteUpdatePostState) {
              Navigator.of(context).pop();
              SnackBarMessage().showSnackBar(
                message: state.message,
                context: context,
                backColor: Colors.red,
              );
            }
          },
          builder: (context, state) {
            if (state is LoadingAddDeleteUpdatePostState)
              return AlertDialog(
                title: LoadingWidget(),
              );
            return DeleteDialogWidget(postId: postId);
          },
        );
      },
    );
  }
}
