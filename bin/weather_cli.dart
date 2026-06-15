import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:weather_cli/config.dart';

Future<void> getWeather(String city) async {
  print('Fetching Data from API....');
  final sw = Stopwatch()..start();
  try {
    final result = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric'),
    );
    if (result.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(result.body);

      print('------------------------------');
      print('${'City'.padRight(15)} : ${data['name']}');
      print('${'Temperature'.padRight(15)} : ${data['main']['temp']} °C');
      print('${'Feels Like'.padRight(15)} : ${data['main']['feels_like']} °C');
      print('${'Description'.padRight(15)} : ${data['weather'][0]['description']}');
      print('${'Humidity'.padRight(15)} : ${data['main']['humidity']} %');
      print('${'Wind'.padRight(15)} : ${data['wind']['speed']} m/s');
      sw.stop();
      print('${'Fetched in'.padRight(15)} : ${sw.elapsedMilliseconds} ms');
      print('------------------------------');
    } else {
      if (result.statusCode == 404) {
        print('City not found');
      } else if (result.statusCode == 401) {
        print('Invalid Api key');
      } else {
        print('Request Failed : ${result.statusCode}');
      }
    }
  } catch (e) {
    print('Error: $e');
  }
}

void main() async {
  while (true) {
    stdout.write('Enter City (or q to quit): ');
    var city = stdin.readLineSync() ?? 'Lahore';
    if (city == 'q') break;
    await getWeather(city);
  }
}
