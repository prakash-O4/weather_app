import 'package:flutter/material.dart';
import 'package:mausam/config/color_constant.dart';
import 'package:mausam/presentation/home/component/custom_button.dart';
import 'package:mausam/presentation/home/component/search_box.dart';
import 'package:mausam/presentation/home/component/temerature_card.dart';
import 'package:mausam/presentation/provider/get_weather_provider.dart';
import 'package:mausam/presentation/shared_components/sf_pro_text.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _queryController;
  @override
  void initState() {
    super.initState();
    _queryController = TextEditingController();
  }

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        elevation: 0.7,
        title: const SFProText(
          text: "Mausamey",
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: SearchBox(controller: _queryController),
                  ),
                ),
                const SizedBox(width: 10),
                CustomButton(
                  onPressed: () {
                    String value = _queryController.text.trim();
                    if (value.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: SFProText(
                            text: "Please enter a city name.",
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else if (value.length < 4) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: SFProText(
                            text:
                                "Name of city must be at least 4 characters long.",
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else {
                      FocusScope.of(context).unfocus();
                      context.read<GetWeatherProvider>().getWeather(
                            _queryController.text,
                          );
                    }
                  },
                  text: "Search",
                ),
              ],
            ),
            const SizedBox(height: 15),
            Consumer(
              builder: (BuildContext context, GetWeatherProvider value,
                  Widget? child) {
                String searchQuery = _queryController.text.trim();
                if (value.getWeatherResponse != null &&
                    value.isLoading == false) {
                  return SFProText(
                    text:
                        "5 Days Forecast in $searchQuery, ${value.getWeatherResponse!.city?.country}",
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  );
                } else if (value.isLoading) {
                  return SFProText(
                    text: "5 days forecast of $searchQuery is: ",
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Consumer<GetWeatherProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  if (value.getWeatherResponse != null &&
                      value.isLoading == false) {
                    return ListView.builder(
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemCount: value.getWeatherResponse!.list?.length ?? 0,
                      itemBuilder: (context, index) {
                        return value.getWeatherResponse != null
                            ? TemperatureCard(
                                index: index,
                                model: value.getWeatherResponse!,
                              )
                            : const SizedBox();
                      },
                    );
                  } else if (value.isLoading == false &&
                      value.errorMessage.isNotEmpty) {
                    return Center(
                      child: SFProText(
                        text: value.errorMessage,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    );
                  } else if (value.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  } else {
                    return const Center(
                      child: SFProText(
                        text: "Search for a city",
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
