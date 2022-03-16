import 'package:flutter/material.dart';

class DefaultTextField {
  TextEditingController? textController;
  InputDecoration? decoration = const InputDecoration();
  String? labelText;
  OutlineInputBorder? border = const OutlineInputBorder();
  ValueChanged<String>? onChanged;

  DefaultTextField({
    required this.textController,
    required this.decoration,
    required this.labelText,
    required this.border,
    required this.onChanged,
  });
}
