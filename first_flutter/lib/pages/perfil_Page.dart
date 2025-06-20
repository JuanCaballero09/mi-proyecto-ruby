import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget{

  @override
  PerfilPageState createState() => PerfilPageState();
}

class PerfilPageState extends State <PerfilPage>{

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFFFF936B),
      title: Center(
        child: Image.asset(
          'assets/imagen5.png',
              width: 170,
        ),

        ),
      ),

  );
}

}