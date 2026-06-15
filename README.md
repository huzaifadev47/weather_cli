# 🌤️ Weather CLI — Dart

A command-line weather app built with Dart using the OpenWeatherMap API.

## Features
- Real-time weather data by city name
- Shows temperature, feels like, humidity, wind speed
- Measures API response time
- Clean formatted terminal output

## Setup

### 1. Clone the repo
```bash
git clone https://github.com/huzaifadev47/weather-cli-dart.git
cd weather-cli-dart
```

### 2. Add API key
Create `lib/config.dart`:
```dart
const String apiKey = 'YOUR_OPENWEATHERMAP_API_KEY';
```
Get a free key at: https://openweathermap.org/api

### 3. Install dependencies
```bash
dart pub get
```

### 4. Run
```bash
dart run
```

## Usage

Enter City (or q to quit): Lahore
City            : Lahore

Temperature     : 34.2 °C

Feels Like      : 38.1 °C

Description     : clear sky

Humidity        : 40 %

Wind            : 3.5 m/s

Fetched in      : 312 ms

## Tech Stack
- Dart
- `http` package
- OpenWeatherMap API

## Note
`lib/config.dart` is excluded via `.gitignore` to protect the API key.

## Author
[huzaifadev47](https://github.com/huzaifadev47)