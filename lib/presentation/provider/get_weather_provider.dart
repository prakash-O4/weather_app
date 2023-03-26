import 'package:flutter/foundation.dart';
import 'package:mausam/config/endpoints.dart';
import 'package:mausam/config/string_constant.dart';
import 'package:mausam/data/repository/event_repository.dart';
import 'package:mausam/models/get_weather_response.dart';

class GetWeatherProvider extends ChangeNotifier {
  final AppRepository appRepository;
  GetWeatherProvider({required this.appRepository});
  bool isLoading = false;
  String errorMessage = "";
  GetWeatherResponse? getWeatherResponse;
  void _isLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getWeather(String name) async {
    _isLoading(true);
    var response = await appRepository.repoHandler(
      path:
          "${RemoteEndpoints.weathers}?q=$name&appid=${StringConstant.apiKey}",
      method: "GET",
    );
    response.fold(
      (l) {
        errorMessage = l.message;
        getWeatherResponse = null;
        _isLoading(false);
      },
      (r) {
        _isLoading(false);
        getWeatherResponse = GetWeatherResponse.fromJson(r);
        notifyListeners();
      },
    );
  }
}
