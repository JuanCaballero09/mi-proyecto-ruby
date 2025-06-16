import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  final List<String> imaglist = [
    "assets/imagen1.jpeg",
    "assets/imagen2.jpeg",
    "assets/imagen3.jpeg",
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselSlider(
          items: widget.imaglist.map((imagePath) {
            return Image.asset(imagePath);
          }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
          ),
        ),
      ),
    );
  }
}
