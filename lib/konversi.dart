// konversi.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});
  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

// This function is used to update the page title
void setPageTitle(String title, BuildContext context) {
  SystemChrome.setApplicationSwitcherDescription(
    ApplicationSwitcherDescription(
      label: title,
      primaryColor:
          Theme.of(context).primaryColor.value, // This line is required
    ),
  );
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  final TextEditingController _fahrenheitController = TextEditingController();
  final TextEditingController _celsiusController = TextEditingController();
  final TextEditingController _reamurController = TextEditingController();
  final TextEditingController _kelvinController = TextEditingController();

  void _convertFromFahrenheit(String value) {
    double fahrenheit = double.tryParse(value) ?? 0.0;
    setState(() {
      _celsiusController.text = ((fahrenheit - 32) * 5 / 9).toStringAsFixed(2);
      _reamurController.text = ((fahrenheit - 32) * 4 / 9).toStringAsFixed(2);
      _kelvinController.text = ((fahrenheit - 32) * 5 / 9 + 273.15)
          .toStringAsFixed(2);
    });
  }

  void _convertFromCelsius(String value) {
    double celsius = double.tryParse(value) ?? 0.0;
    setState(() {
      _fahrenheitController.text = ((celsius * 9 / 5) + 32).toStringAsFixed(2);
      _reamurController.text = (celsius * 4 / 5).toStringAsFixed(2);
      _kelvinController.text = (celsius + 273.15).toStringAsFixed(2);
    });
  }

  void _convertFromReamur(String value) {
    double reamur = double.tryParse(value) ?? 0.0;
    setState(() {
      _fahrenheitController.text = ((reamur * 9 / 4) + 32).toStringAsFixed(2);
      _celsiusController.text = (reamur * 5 / 4).toStringAsFixed(2);
      _kelvinController.text = ((reamur * 5 / 4) + 273.15).toStringAsFixed(2);
    });
  }

  void _convertFromKelvin(String value) {
    double kelvin = double.tryParse(value) ?? 0.0;
    setState(() {
      _fahrenheitController.text = ((kelvin - 273.15) * 9 / 5 + 32)
          .toStringAsFixed(2);
      _celsiusController.text = (kelvin - 273.15).toStringAsFixed(2);
      _reamurController.text = ((kelvin - 273.15) * 4 / 5).toStringAsFixed(2);
    });
  }

  Widget _buildTemperatureField(
    String label,
    TextEditingController controller,
    Function(String) onChanged,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*$')),
        ],
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    setPageTitle('Konversi', context);
    return Scaffold(
      appBar: AppBar(title: Text('Konversi Suhu'), centerTitle: true
      ),
      backgroundColor: Color.fromRGBO(230, 204, 178, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTemperatureField(
              'Fahrenheit',
              _fahrenheitController,
              _convertFromFahrenheit,
            ),
            _buildTemperatureField(
              'Celsius',
              _celsiusController,
              _convertFromCelsius,
            ),
            _buildTemperatureField(
              'Reamur',
              _reamurController,
              _convertFromReamur,
            ),
            _buildTemperatureField(
              'Kelvin',
              _kelvinController,
              _convertFromKelvin,
            ),
          ],
        ),
      ),
    );
  }
}