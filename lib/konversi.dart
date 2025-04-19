import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konversisuhu/converter_provider.dart';
import 'package:provider/provider.dart';

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
    final provider = context.watch<CounterProvider>();

    return Scaffold(
      appBar: AppBar(title: Text('Konversi Suhu'), centerTitle: true),
      backgroundColor: Color.fromRGBO(230, 204, 178, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTemperatureField(
              'Celsius',
              provider.celsiusController,
              (value) {}, // Tidak perlu aksi tambahan karena listener sudah ada
            ),
            _buildTemperatureField(
              'Fahrenheit',
              provider.fahrenheitController,
              (value) {}, // Field ini hanya untuk menampilkan hasil
            ),
            _buildTemperatureField(
              'reamur',
              provider.reamurController,
              (value) {}, // Field ini hanya untuk menampilkan hasil
            ),
            _buildTemperatureField(
              'kelvin',
              provider.kelvinController,
              (value) {}, // Field ini hanya untuk menampilkan hasil
            ),
          ],
        ),
      ),
    );
  }
}
