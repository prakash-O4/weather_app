import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mausam/core/environments.dart';
import 'package:mausam/presentation/home/home_screen.dart';
import 'package:mausam/presentation/intro/intro_screen.dart';
import 'package:mausam/presentation/provider/get_weather_provider.dart';
import 'package:provider/provider.dart';

import 'core/servers.dart';
import 'data/api_client/api_client.dart';
import 'di/injector.dart';

void main() {
  setUpLocator();
  setServer();
  runApp(const MyApp());
}

setServer() {
  if (kDebugMode) {
    sl<ApiClient>().init(server: LiveServer());
  } else {
    if (EnvironmentConfig.server == "test") {
      sl<ApiClient>().init(server: TestServer());
    } else {
      sl<ApiClient>().init(server: TestServer());
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => sl<GetWeatherProvider>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const IntroScreen(),
      ),
    );
  }
}
