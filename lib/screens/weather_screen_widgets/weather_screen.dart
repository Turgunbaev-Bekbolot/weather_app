import 'package:flutter/material.dart';
import 'package:weather_app_lesson44/models/weather_models.dart';
import 'package:weather_app_lesson44/screens/weather_screen_widgets/weather_screen_body.dart';

class WeatherScreen extends StatefulWidget {
  final WeatherModel weatherModel;

  const WeatherScreen({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.blue.shade200,
      body: WeatherScreenBody(
        weatherModel: widget.weatherModel,
      ),
    );
  }
}
