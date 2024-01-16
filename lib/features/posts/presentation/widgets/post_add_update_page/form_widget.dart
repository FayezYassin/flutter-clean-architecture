
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/domain/entities/posts.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_event.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/widgets/post_add_update_page/form_submit_button.dart';
import 'package:flutter_cleanartchictor_examp/features/posts/presentation/widgets/post_add_update_page/text_form_filed_widget.dart';

class FormWidget extends StatefulWidget {
  final bool isUpdatePost;
  final Post? post;


  FormWidget({super.key, required this.isUpdatePost, this.post});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  var _titleController = TextEditingController();
  var _bodyController = TextEditingController();
  @override
  void initState() {
    if (widget.isUpdatePost) {
      _titleController.text = widget.post!.title;
      _bodyController.text = widget.post!.body;
    }
    super.initState();
  }

  void validateFormThenUpdateOrAddPost() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final post = Post(
        id: widget.isUpdatePost ? widget.post!.id : null,
        title: _titleController.text,
        body: _bodyController.text,
      );
      if (widget.isUpdatePost) {
        BlocProvider.of<AddDeleteUpdatePostBloc>(context)
            .add(UpdatePostEvent(post: post));
      } else {
        BlocProvider.of<AddDeleteUpdatePostBloc>(context)
            .add(AddPostEvent(post: post));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormFieldWidget(
              name: "Title", multiLines: false, controller: _titleController),
          TextFormFieldWidget(
              name: "Body", multiLines: true, controller: _bodyController),
          FormSubmitButton(
            isUpdatePost: widget.isUpdatePost,
            onPressed: validateFormThenUpdateOrAddPost,
          ),
        ],
      ),
    );
  }
}
