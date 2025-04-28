import 'package:flutter/material.dart';
import 'dart:math';

class AreaCalculatorPage extends StatefulWidget {
  const AreaCalculatorPage({super.key});

  @override
  State<AreaCalculatorPage> createState() => _AreaCalculatorPageState();
}

class _AreaCalculatorPageState extends State<AreaCalculatorPage> {
  String shape = 'Persegi';
  final TextEditingController sisiController = TextEditingController();
  final TextEditingController alasController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();
  final TextEditingController jariJariController = TextEditingController();
  double hasil = 0;

  void calculateArea() {
    setState(() {
      if (shape == 'Persegi') {
        double sisi = double.tryParse(sisiController.text) ?? 0;
        hasil = sisi * sisi;
      } else if (shape == 'Segitiga') {
        double alas = double.tryParse(alasController.text) ?? 0;
        double tinggi = double.tryParse(tinggiController.text) ?? 0;
        hasil = 0.5 * alas * tinggi;
      } else if (shape == 'Lingkaran') {
        double r = double.tryParse(jariJariController.text) ?? 0;
        hasil = pi * r * r;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          DropdownButton<String>(
            value: shape,
            items: ['Persegi', 'Segitiga', 'Lingkaran'].map((e) {
              return DropdownMenuItem(value: e, child: Text(e));
            }).toList(),
            onChanged: (value) {
              setState(() {
                shape = value!;
              });
            },
          ),
          if (shape == 'Persegi')
            TextField(controller: sisiController, decoration: const InputDecoration(labelText: 'Sisi')),
          if (shape == 'Segitiga') ...[
            TextField(controller: alasController, decoration: const InputDecoration(labelText: 'Alas')),
            TextField(controller: tinggiController, decoration: const InputDecoration(labelText: 'Tinggi')),
          ],
          if (shape == 'Lingkaran')
            TextField(controller: jariJariController, decoration: const InputDecoration(labelText: 'Jari-jari')),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: calculateArea, child: const Text('Hitung Luas')),
          const SizedBox(height: 20),
          Text('Hasil: $hasil', style: const TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
