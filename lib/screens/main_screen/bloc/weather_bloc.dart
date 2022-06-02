import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_lesson44/commands/helpers/catch_axeption_helper.dart';
import 'package:weather_app_lesson44/models/weather_models.dart';
import 'package:weather_app_lesson44/screens/main_screen/bloc/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) {});
    on<GetWeatherEvent>((event, emit) async {
      emit(WeatherLoadingState());
      try {
        WeatherModel weatherModel =
            await UserRaepository().getweather(event.city);
        emit(WeatherFetchedState(weatherModel: weatherModel));
      } catch (e) {
        emit(WeatherErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
