import 'dart:async';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imaglist = [
    "assets/imagen1.jpeg",
    "assets/imagen2.jpeg",
    "assets/imagen3.jpeg",
  ];

  final PageController _pageController = PageController(initialPage: 1000); // Empieza en un número alto
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _currentIndex = 1000;

    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      _currentIndex++;

      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final actualIndex = index % imaglist.length;  // Calcula índice real con módulo
          return Image.asset(imaglist[actualIndex], fit: BoxFit.cover);
        },
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
