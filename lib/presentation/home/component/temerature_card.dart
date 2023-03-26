import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mausam/models/get_weather_response.dart';
import 'package:mausam/presentation/shared_components/sf_pro_text.dart';

class TemperatureCard extends StatelessWidget {
  final GetWeatherResponse model;
  final int index;
  const TemperatureCard({
    Key? key,
    required this.model,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String getImageUrl() {
      if (model.list?[index].weather?.isNotEmpty ?? false) {
        return "https://openweathermap.org/img/wn/${model.list?[index].weather?[0].icon}.png";
      }
      return "";
    }

    String getFormattedDate() {
      if (model.list?[index].dtTxt != null) {
        String formattedDate =
            DateFormat('yyyy-MM-dd').format(model.list![index].dtTxt!);
        return formattedDate;
      }
      return "N/A";
    }

    String getFormattedTime() {
      if (model.list?[index].dtTxt != null) {
        String formattedDate =
            DateFormat('hh:mm a').format(model.list![index].dtTxt!);
        return formattedDate;
      }
      return "N/A";
    }

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          color: Colors.white,
          width: 0.9,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SFProText(
                text: "${getFormattedDate()}, ${getFormattedTime()}",
                textStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.white.withOpacity(0.85),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                clipBehavior: Clip.antiAlias,
                child: CachedNetworkImage(
                  errorWidget: (context, url, error) {
                    return Container(
                      color: Colors.red,
                    );
                  },
                  fit: BoxFit.cover,
                  imageUrl: getImageUrl(),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.white,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    SFProText(
                      text: "Temperature: ${model.list?[index].main?.temp}  F",
                      textStyle: const TextStyle(
                        fontSize: 13.4,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SFProText(
                      text: "Min Temp: ${model.list?[index].main?.tempMin} F",
                      textStyle: const TextStyle(
                        fontSize: 13.4,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SFProText(
                      text: "Max Temp: ${model.list?[index].main?.tempMax} F",
                      textStyle: const TextStyle(
                        fontSize: 13.4,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    SFProText(
                      text:
                          "Pressure: ${model.list?[index].main?.pressure}  Pa",
                      textStyle: const TextStyle(
                        fontSize: 13.4,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SFProText(
                      text: "Wind: ${model.list?[index].wind?.speed} km/hr",
                      textStyle: const TextStyle(
                        fontSize: 13.4,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SFProText(
                      text:
                          "Humidity: ${model.list?[index].main?.humidity} g.m-3",
                      textStyle: const TextStyle(
                        fontSize: 13.4,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
