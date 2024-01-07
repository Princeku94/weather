import '/screens/home_screen.dart';
import '/services/weather.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // WeatherModel weatherModel = WeatherModel();

    var weatherDataHourly = await WeatherModel().getLocationWeather();
    var currentWeatherData = await WeatherModel().getCurrentTemp();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                  currentWeather: currentWeatherData,
                  weatherData: weatherDataHourly,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
         height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(145, 131, 222, 1),
        Color.fromRGBO(160, 148, 227, 1)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
   
        child: 
         
          const Center(
            child: SpinKitFadingCube(
              color: Colors.white,
              size: 120,
            ),
          ),
        
      ),
    );
  }
}
