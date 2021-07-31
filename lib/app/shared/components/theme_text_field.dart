import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shared/data/extensions.dart';

class ThemeTextField extends StatefulWidget {
  final String? hintText;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? onFieldSubmitted;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  const ThemeTextField({
    Key? key,
    this.hintText,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.keyboardType,
    this.prefixIcon,
    this.controller,
  }) : super(key: key);
  @override
  _OrbeFormFieldState createState() => _OrbeFormFieldState();
}

class _OrbeFormFieldState extends State<ThemeTextField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    final size1 = context.constSize1;
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      cursorHeight: size1 * 25.0,
      cursorWidth: size1 * 2.5,
      style: TextStyle(fontSize: size1 * 20),
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: size1 * 20),
        filled: true,
        alignLabelWithHint: true,
        fillColor: Colors.grey[350],
        prefixIcon: widget.prefixIcon != null ? widget.prefixIcon : null,
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: size1 * 20),
        errorMaxLines: 3,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
