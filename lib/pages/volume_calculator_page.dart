import 'package:flutter/material.dart';

class VolumeCalculatorPage extends StatefulWidget {
  const VolumeCalculatorPage({super.key});

  @override
  State<VolumeCalculatorPage> createState() => _VolumeCalculatorPageState();
}

class _VolumeCalculatorPageState extends State<VolumeCalculatorPage> {
  String shape = 'Balok';
  final TextEditingController panjangController = TextEditingController();
  final TextEditingController lebarController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();
  final TextEditingController alasController = TextEditingController();
  final TextEditingController jariJariController = TextEditingController();
  double hasil = 0;

  void calculateVolume() {
    setState(() {
      if (shape == 'Balok') {
        double panjang = double.tryParse(panjangController.text) ?? 0;
        double lebar = double.tryParse(lebarController.text) ?? 0;
        double tinggi = double.tryParse(tinggiController.text) ?? 0;
        hasil = panjang * lebar * tinggi;
      } else if (shape == 'Piramid') {
        double alas = double.tryParse(alasController.text) ?? 0;
        double tinggi = double.tryParse(tinggiController.text) ?? 0;
        hasil = (1/3) * alas * tinggi;
      } else if (shape == 'Tabung') {
        double r = double.tryParse(jariJariController.text) ?? 0;
        double tinggi = double.tryParse(tinggiController.text) ?? 0;
        hasil = 3.14 * r * r * tinggi;
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
            items: ['Balok', 'Piramid', 'Tabung'].map((e) {
              return DropdownMenuItem(value: e, child: Text(e));
            }).toList(),
            onChanged: (value) {
              setState(() {
                shape = value!;
              });
            },
          ),
          if (shape == 'Balok') ...[
            TextField(controller: panjangController, decoration: const InputDecoration(labelText: 'Panjang')),
            TextField(controller: lebarController, decoration: const InputDecoration(labelText: 'Lebar')),
            TextField(controller: tinggiController, decoration: const InputDecoration(labelText: 'Tinggi')),
          ],
          if (shape == 'Piramid') ...[
            TextField(controller: alasController, decoration: const InputDecoration(labelText: 'Luas Alas')),
            TextField(controller: tinggiController, decoration: const InputDecoration(labelText: 'Tinggi')),
          ],
          if (shape == 'Tabung') ...[
            TextField(controller: jariJariController, decoration: const InputDecoration(labelText: 'Jari-jari')),
            TextField(controller: tinggiController, decoration: const InputDecoration(labelText: 'Tinggi')),
          ],
          const SizedBox(height: 20),
          ElevatedButton(onPressed: calculateVolume, child: const Text('Hitung Volume')),
          const SizedBox(height: 20),
          Text('Hasil: $hasil', style: const TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
