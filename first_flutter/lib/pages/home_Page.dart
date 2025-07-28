import 'dart:async';
import 'package:flutter/material.dart';
import 'notificacion_Page.dart';

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

  final PageController _pageController = PageController(
    initialPage: 1000,
  ); // Empieza en un número alto
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
      appBar: AppBar(
        toolbarHeight: 40,
       automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color(0xFFFF936B),
        title: Center(
          child:(
            Image.asset(
              "assets/imagen5.png",
              width: 150,
            )
          ),
        ),
        
        actions: [
          
          IconButton(
            padding: EdgeInsets.zero,
  constraints: BoxConstraints(),
            icon: Icon(Icons.notifications, 
            size: 20,
            color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificacionPage()),
              );
            },
          ),
          IconButton(icon: Icon(Icons.location_on,           : Colors.white), onPressed: () {}),
        ],
      ),

      body: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final actualIndex =
              index % imaglist.length; // Calcula índice real con módulo
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
