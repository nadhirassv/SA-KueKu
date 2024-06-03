import 'package:flutter/material.dart';
import 'package:kue_ku/page/bruteforce_page.dart';
import 'package:kue_ku/page/bruteforce_price_page.dart';
import 'package:kue_ku/page/greedy_page.dart';
import 'package:kue_ku/page/greedy_price_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    DessertRecommendationGreedy(),
    DessertRecommendationBruteforce(),
    DessertRecommendationGreedyPrice(),
    DessertRecommendationBruteforcePrice(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        fixedColor: Colors.blueAccent,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Text("1"),
            label: 'Greedy Rating',
          ),
          BottomNavigationBarItem(
            icon: Text("2"),
            label: 'BF Rating',
          ),
          BottomNavigationBarItem(
            icon: Text("3"),
            label: 'Greedy Price',
          ),
          BottomNavigationBarItem(
            icon: Text("4"),
            label: 'BF Price',
          )
        ],
      ),
    );
  }
}
