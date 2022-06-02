import 'package:flutter/material.dart';
import 'package:weather_app_lesson44/commands/theme_helper.dart';

class MainScreenTextField extends StatelessWidget {
  const MainScreenTextField({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeHelper.black,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeHelper.black),
        ),
      ),
    );
  }
}
