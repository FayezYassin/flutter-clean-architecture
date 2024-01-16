import 'package:flutter/material.dart';

class SnackBarMessage {
  void showSnackBar(
      {required String message, required BuildContext context,Color backColor = Colors.yellow}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: backColor,
      ),
    );
  }
}
