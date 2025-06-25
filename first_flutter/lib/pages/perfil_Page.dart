import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton.icon(
  onPressed: () {
    // Elimina todo lo anterior y vuelve a la pantalla Welcome
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/welcome',
      (route) => false,
    );
  },
  icon: Icon(Icons.logout),
  label: Text('Cerrar sesión'),
  style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red[600],
       foregroundColor: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
       ),
      ),
    );
  }
}
