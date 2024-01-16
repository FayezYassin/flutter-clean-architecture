import 'package:flutter/material.dart';

class FormSubmitButton extends StatelessWidget {
  final void Function() onPressed;
  final bool isUpdatePost;

  const FormSubmitButton({
    super.key,
    required this.onPressed,
    required this.isUpdatePost,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: isUpdatePost ? Icon(Icons.edit) : Icon(Icons.add),
      label: Text(isUpdatePost ? "Update" : "Add"),
      onPressed: onPressed,
    );
  }
}
