import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  double _fahrenheit = 0.0;
  double _celsius = 0.0;
  double _reamur = 0.0;
  double _kelvin = 0.0;

  double get fahrenheit => _fahrenheit;
  double get celsius => _celsius;
  double get reamur => _reamur;
  double get kelvin => _kelvin;

  void convertFromFahrenheit(String value) {
    _fahrenheit = double.tryParse(value) ?? 0.0;
    _celsius = (_fahrenheit - 32) * 5 / 9;
    _reamur = (_fahrenheit - 32) * 4 / 9;
    _kelvin = (_fahrenheit - 32) * 5 / 9 + 273.15;
    notifyListeners();
  }

  void convertFromCelsius(String value) {
    _celsius = double.tryParse(value) ?? 0.0;
    _fahrenheit = (_celsius * 9 / 5) + 32;
    _reamur = (_celsius * 4 / 5);
    _kelvin = (_celsius + 273.15);
    notifyListeners();
  }

  final TextEditingController celsiusController = TextEditingController();
  final TextEditingController fahrenheitController = TextEditingController();
  final TextEditingController reamurController = TextEditingController();
  final TextEditingController kelvinController = TextEditingController();

  bool isUpdating = false; // Flag untuk mencegah loop listener

  CounterProvider() {
    // Listener untuk field Celsius
    celsiusController.addListener(() {
      if (isUpdating) return; // Cegah loop listener
      isUpdating = true;

      final celsiusValue = double.tryParse(celsiusController.text) ?? 0;
      final fahrenheitValue = (celsiusValue * 9 / 5) + 32;
      final reamurValue = celsiusValue * 4 / 5;
      final kelvinValue = celsiusValue + 273.15;

      fahrenheitController.text = fahrenheitValue.toStringAsFixed(2);
      reamurController.text = reamurValue.toStringAsFixed(2);
      kelvinController.text = kelvinValue.toStringAsFixed(2);

      isUpdating = false;
    });

    // Listener untuk field Fahrenheit
    fahrenheitController.addListener(() {
      if (isUpdating) return; // Cegah loop listener
      isUpdating = true;

      final fahrenheitValue = double.tryParse(fahrenheitController.text) ?? 0;
      final celsiusValue = (fahrenheitValue - 32) * 5 / 9;
      final reamurValue = (fahrenheitValue - 32) * 4 / 9;
      final kelvinValue = (fahrenheitValue - 32) * 5 / 9 + 273.15;

      celsiusController.text = celsiusValue.toStringAsFixed(2);
      reamurController.text = reamurValue.toStringAsFixed(2);
      kelvinController.text = kelvinValue.toStringAsFixed(2);

      isUpdating = false;
    });

    // Listener untuk field Reamur
    reamurController.addListener(() {
      if (isUpdating) return; // Cegah loop listener
      isUpdating = true;

      final reamurValue = double.tryParse(reamurController.text) ?? 0;
      final celsiusValue = reamurValue * 5 / 4;
      final fahrenheitValue = (reamurValue * 9 / 4) + 32;
      final kelvinValue = (reamurValue * 5 / 4) + 273.15;

      celsiusController.text = celsiusValue.toStringAsFixed(2);
      fahrenheitController.text = fahrenheitValue.toStringAsFixed(2);
      kelvinController.text = kelvinValue.toStringAsFixed(2);

      isUpdating = false;
    });

    // Listener untuk field Kelvin
    kelvinController.addListener(() {
      if (isUpdating) return; // Cegah loop listener
      isUpdating = true;

      final kelvinValue = double.tryParse(kelvinController.text) ?? 0;
      final celsiusValue = kelvinValue - 273.15;
      final fahrenheitValue = (kelvinValue - 273.15) * 9 / 5 + 32;
      final reamurValue = (kelvinValue - 273.15) * 4 / 5;

      celsiusController.text = celsiusValue.toStringAsFixed(2);
      fahrenheitController.text = fahrenheitValue.toStringAsFixed(2);
      reamurController.text = reamurValue.toStringAsFixed(2);

      isUpdating = false;
    });
  }

  @override
  void dispose() {
    celsiusController.dispose();
    fahrenheitController.dispose();
    reamurController.dispose();
    kelvinController.dispose();
    super.dispose();
  }
}
