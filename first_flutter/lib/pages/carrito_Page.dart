import 'package:flutter/material.dart';

class CarritoPage extends StatefulWidget{

  @override
  CarritoPageState createState() => CarritoPageState();
}

class CarritoPageState extends State <CarritoPage>{

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
      ),

    body: ListView(
      children: [
        
      ],
      


    )


  );
}

}