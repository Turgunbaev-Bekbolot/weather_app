import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_lesson44/commands/theme_helper.dart';
import 'package:weather_app_lesson44/screens/main_screen/bloc/weather_bloc.dart';
import 'package:weather_app_lesson44/screens/weather_screen.dart';

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
        TextFormField(
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
        ),
        SizedBox(
          height: 40,
        ),
        BlocConsumer<WeatherBloc, WeatherState>(
            bloc: weatherBloc,
            listener: (context, state) {
              if (state is WeatherErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error.message!)));
              }
              if (state is WeatherFetchedState) {
                textEditingController.clear();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            WeatherScreen(weatherModel: state.weatherModel))));
              }
            },
            builder: (context, state) {
              if (state is WeatherLoadingState) {
                return CircularProgressIndicator();
              }
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: ThemeHelper.black),
                  onPressed: () {
                    weatherBloc
                        .add(GetWeatherEvent(city: textEditingController.text));
                  },
                  child: Text('Search city',
                      style: TextHelper.medium14
                          .copyWith(color: ThemeHelper.white)));
            })
      ],
    ));
  }
}
