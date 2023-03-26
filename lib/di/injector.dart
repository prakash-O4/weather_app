import 'package:get_it/get_it.dart';

import '../data/api_client/api_client.dart';
import '../data/repository/event_repository.dart';
import '../presentation/provider/get_weather_provider.dart';

var sl = GetIt.instance;

void setUpLocator() {
  sl.registerLazySingleton(() => ApiClient());
  sl.registerLazySingleton(() => AppRepository());
  sl.registerLazySingleton(() => GetWeatherProvider(appRepository: sl()));
}
