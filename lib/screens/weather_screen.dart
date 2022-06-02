import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_lesson44/models/weather_models.dart';

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
  void initState() {
    super.initState();
  }

  getDateFormat(int date) {
    var millis = date;
    var dt =
        DateTime.fromMillisecondsSinceEpoch(widget.weatherModel.dt! * 1000);

    return DateFormat('dd.MMMM.yyyy \n       HH:mm').format(dt);
  }

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
        body: Center(
          child: Column(
            children: [
              Text(
                getDateFormat(widget.weatherModel.dt!),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 15),
              //   child: Text(
              //     widget.weatherModel.timezone.toString(),
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 24,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
              Text(
                widget.weatherModel.name.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 40),
                child: Image.network(
                    "https://openweathermap.org/img/wn/${widget.weatherModel.weather!.first.icon}@4x.png"),
              ),
              Text(
                widget.weatherModel.main!.temp.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                'Monday',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ));
  }
}
