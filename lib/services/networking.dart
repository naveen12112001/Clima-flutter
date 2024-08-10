// ignore_for_file: prefer_const_constructors
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'location.dart';

const apiKey = '85a851596fa9dce390af25c429a4a297';

class NetworkHelper {
  Future getcityWeather(String cityName) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric'));
    String data = response.body;
    return jsonDecode(data);
  }

  Future getData() async {
    Location location = Location();
    await location.getCurrentLocation();
    double llongitude = location.longitude;
    double llatitude = location.latitude;
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$llatitude&lon=$llongitude&appid=$apiKey&units=metric'));
    String data = response.body;
    print(data);
    return jsonDecode(data);
  }
}
