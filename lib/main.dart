import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/weather_details.dart';
import 'package:weather_app/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => WeatherServices(city: "London"),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController cityNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: cityNameController,
          decoration: const InputDecoration(
            hintText: 'Search city...',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
          onSubmitted: (cityName) {
            if (cityName.trim().isNotEmpty) {
              final weatherService =
                  Provider.of<WeatherServices>(context, listen: false);
              weatherService.setCity(cityName.trim());
              weatherService.fetchWeatherData(cityName.trim());
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WeatherDetails()),
              );
            }
          },
        ),
      ),
      body: const Center(
        child: Text(
            'Enter a city name in the search bar to get weather details.',
            style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
