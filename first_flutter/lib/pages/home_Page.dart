import 'dart:async';
import 'package:flutter/material.dart';
import 'notificacion_Page.dart';
import 'location_Page.dart';

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

  final PageController _pageController = PageController(initialPage: 1000);
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
        backgroundColor: const Color.fromRGBO(237, 88, 33, 1),
        title: Center(child: Image.asset("assets/imagen5.png", width: 150)),
        leading: SizedBox(width: 48),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(Icons.notifications, size: 20, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificacionPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.location_on, size: 20, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocationPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('PROMOCIONES'),

            SizedBox(
              height:
                  MediaQuery.of(context).size.width *
                  9 /
                  16, // altura adaptable
              child: PageView.builder(
                controller: _pageController,
                itemBuilder: (context, index) {
                  final actualIndex = index % imaglist.length;
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imaglist[actualIndex],
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            _buildSectionTitle('NOVEDADES'),
            _buildHorizontalCards([
              'NUEVO PRODUCTO',
              'NUEVO CATÁLOGO 2025',
              'NUEVO SERVICIO',
            ]),
            _buildSectionTitle('CATEGORIAS'),
            _buildHorizontalCards(['PIZZA', 'PERROS', 'HAMBURGUESAS']),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildHorizontalCards(List<String> items) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            width: 160,
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                items[index],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),
          );
        },
      ),
    );
  }
}
