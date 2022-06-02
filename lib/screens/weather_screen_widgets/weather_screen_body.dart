import 'package:flutter/material.dart';
import 'package:weather_app_lesson44/commands/helpers/format_helpers.dart';

import 'package:weather_app_lesson44/models/weather_models.dart';
import 'package:weather_app_lesson44/screens/weather_screen_widgets/weather_screen_texts.dart';

class WeatherScreenBody extends StatefulWidget {
  final WeatherModel weatherModel;
  const WeatherScreenBody({Key? key, required this.weatherModel})
      : super(key: key);

  @override
  State<WeatherScreenBody> createState() => _WeatherScreenBodyState();
}

class _WeatherScreenBodyState extends State<WeatherScreenBody> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          WeatherScreenTexts(
            text: FormatConverter()
                .getDateFormat(widget.weatherModel.dt!)
                .toString(),
            fontSize: 17,
          ),
          SizedBox(
            height: 30,
          ),
          WeatherScreenTexts(
            text: FormatConverter()
                .getTimeFormat(widget.weatherModel.dt!)
                .toString(),
            fontSize: 27,
          ),
          SizedBox(
            height: 30,
          ),
          WeatherScreenTexts(
              text: widget.weatherModel.name.toString(), fontSize: 28),
          WeatherScreenTexts(
              text: widget.weatherModel.sys!.country.toString(), fontSize: 22),
          Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 40),
            child: Image.network(
                "https://openweathermap.org/img/wn/${widget.weatherModel.weather!.first.icon}@4x.png"),
          ),
          WeatherScreenTexts(
              text: FormatConverter()
                  .getCelcTemp(widget.weatherModel.main!.temp!)
                  .toString(),
              isIcon: true,
              fontSize: 30),
          SizedBox(
            height: 48,
          ),
          WeatherScreenTexts(text: 'Monday', fontSize: 19),
        ],
      ),
    );
  }
}
