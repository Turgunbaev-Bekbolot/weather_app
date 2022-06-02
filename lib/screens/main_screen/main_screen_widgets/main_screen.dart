import 'package:flutter/material.dart';
import 'package:weather_app_lesson44/commands/theme_helper.dart';
import 'package:weather_app_lesson44/screens/main_screen/bloc/weather_bloc.dart';
import 'package:weather_app_lesson44/screens/main_screen/main_screen_widgets/main_screen_bloc.dart';
import 'package:weather_app_lesson44/screens/main_screen/main_screen_widgets/main_screen_textfield.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  WeatherBloc weatherBloc = WeatherBloc();
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    weatherBloc = WeatherBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Enter your country ',
          style: TextHelper.bold40.copyWith(color: ThemeHelper.black),
        ),
        MainScreenTextField(textEditingController: textEditingController),
        SizedBox(
          height: 40,
        ),
        MainScreenBloc(
            weatherBloc: weatherBloc,
            textEditingController: textEditingController)
      ],
    ));
  }
}
