import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/weather_provider.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final weather = Provider.of<WeatherServices>(context);
    final weatherData = weather.weatherData;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Details'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: weatherData != null
            ? Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        weatherData.location.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${weatherData.current.tempC}°C / ${weatherData.current.tempF}°F',
                        style: const TextStyle(fontSize: 22),
                      ),
                      const SizedBox(height: 10),
                      Text("Feels Like: ${weatherData.current.feelslikeC}°C"),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https:${weatherData.current.condition.icon}',
                            width: 50,
                            height: 50,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            weatherData.current.condition.text,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Humidity: ${weatherData.current.humidity}%',
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Wind Speed: ${weatherData.current.windKph} km/h',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              )
            : const Text(
                'No weather data available.',
                style: TextStyle(fontSize: 20),
              ),
      ),
    );
  }
}
