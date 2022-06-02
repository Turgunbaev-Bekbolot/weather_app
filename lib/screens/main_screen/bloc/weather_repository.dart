import 'package:weather_app_lesson44/models/weather_models.dart';
import 'package:weather_app_lesson44/screens/main_screen/bloc/weather_provider.dart';

class UserRaepository {
  Future<WeatherModel> getweather(String city) {
    UserProvider provider = UserProvider();
    return provider.getWeather(city);
  }
}
