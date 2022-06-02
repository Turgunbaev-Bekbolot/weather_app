import 'package:flutter/material.dart';

class WeatherScreenTexts extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool? isIcon;

  const WeatherScreenTexts({
    Key? key,
    required this.text,
    required this.fontSize,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
        isIcon!
            ? SizedBox(
                width: 30,
                height: 30,
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/15/15752.png',
                  color: Colors.white,
                ))
            : SizedBox(),
      ],
    );
  }
}
