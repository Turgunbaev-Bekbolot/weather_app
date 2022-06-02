import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_lesson44/commands/theme_helper.dart';
import 'package:weather_app_lesson44/screens/main_screen/bloc/weather_bloc.dart';
import 'package:weather_app_lesson44/screens/weather_screen_widgets/weather_screen.dart';

class MainScreenBloc extends StatelessWidget {
  const MainScreenBloc({
    Key? key,
    required this.weatherBloc,
    required this.textEditingController,
  }) : super(key: key);

  final WeatherBloc weatherBloc;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherBloc, WeatherState>(
        bloc: weatherBloc,
        listener: (context, state) {
          if (state is WeatherErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error.message!)));
          }
          if (state is WeatherFetchedState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) =>
                        WeatherScreen(weatherModel: state.weatherModel))));
            textEditingController.clear();
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
                  style:
                      TextHelper.medium14.copyWith(color: ThemeHelper.white)));
        });
  }
}
