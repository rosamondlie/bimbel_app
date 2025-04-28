import 'package:flutter/material.dart';
import 'package:bimbel_app/pages/counter_page.dart';
import 'package:bimbel_app/pages/area_calculator_page.dart';
import 'package:bimbel_app/pages/volume_calculator_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final pages = [
    const CounterPage(),
    const AreaCalculatorPage(),
    const VolumeCalculatorPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Selamat Datang, ${user?.email ?? "User"}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Counter'),
          BottomNavigationBarItem(icon: Icon(Icons.square_foot), label: 'Area'),
          BottomNavigationBarItem(icon: Icon(Icons.stacked_bar_chart), label: 'Volume'),
        ],
      ),
    );
  }
}
