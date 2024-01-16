import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool multiLines;
  final String name;

  const TextFormFieldWidget(
      {Key? key,
      required this.controller,
      required this.multiLines,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: TextFormField(
        controller: controller,
        validator: (value) => value!.isEmpty ? "$name Can't be Empty" : null,
        decoration: InputDecoration(hintText: "$name"),
        minLines: multiLines ? 6 : 1,
        maxLines: multiLines ? 6 : 1,
      ),
    );
  }
}
