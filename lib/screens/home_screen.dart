import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Eventos'),
      ),
      body: const Center(
        child: Text('Listado de eventos irá aquí'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(
              '/addEvent'); // Aquí abrirías la pantalla para añadir un nuevo evento
        },
      ),
    );
  }
}
