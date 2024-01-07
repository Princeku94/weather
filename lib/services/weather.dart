import '../services/location.dart';
import '/services/networking.dart';
import 'api_data.dart';

const weatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCurrentTemp() async{
     Location location = Location();
    await location.getCurrentLocation();

    String url =
        '$weatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(url: url);

    var weatherData = await networkHelper.getData();

    print(weatherData);
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    // String url =
    //     '$weatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';

    String url =
        'https://api.openweathermap.org/data/2.5/forecast?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(url: url);

    var weatherData = await networkHelper.getData();

    print(weatherData);
    return weatherData;
  }



  String getWeatherIcon(int temp) {
    if (temp >= 25) {
      return '☀️';
    } else if (temp >= 20) {
      return '☁️';
    } else if (temp <= 10) {
      return '☁️';
    } else {
      return '🌧';
    }
  }

  
  String getMessage(int temp) {
    if (temp >= 25) {
      return 'Sunny';
    } else if (temp >= 20) {
      return 'Cloudy';
    } else if (temp <= 10) {
      return 'Cloudy';
    } else {
      return 'Rainy';
    }
  }
}
