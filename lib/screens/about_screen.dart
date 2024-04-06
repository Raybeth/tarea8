import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Acerca de"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Nombre: [Nombre del Delegado]",
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text("Apellido: [Apellido del Delegado]",
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text("Matrícula: [Matrícula]", style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text("Frase sobre democracia: [Tu Frase Aquí]",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
