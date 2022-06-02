import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:weather_app_lesson44/commands/helpers/api_requester.dart';
import 'package:weather_app_lesson44/commands/helpers/catch_axeption_helper.dart';
import 'package:weather_app_lesson44/models/weather_models.dart';

class UserProvider {
  Future<WeatherModel> getWeather(String city) async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.get('', param: {
        'q': city,
        'appid': '4c7c57b539597b29864d5b4be2fd5fa3',
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        return WeatherModel.fromJson(response.data);
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      print(e);
      throw CatchException.convertException(e);
    }
  }
}
