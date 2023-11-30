import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cards Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cards en Flutter'),
        ),
        body: const CardsWidget(title: 'Cards en Flutter'),
      ),
    );
  }
}

class CardsWidget extends StatelessWidget {
  const CardsWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Permite que el contenido de la columna se desplace
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CustomCard(
            title: 'Sede Osorno',
            description: 'Descripción de Sede Osorno.',
            imagePath: 'assets/Sede_Osorno.jpg',
          ),
          const CustomCard(
            title: 'Sede Puerto Montt',
            description: 'Descripción de Sede Puerto Montt.',
            imagePath: 'assets/Sede_PuertoMontt.jpg',
          ),
          const CustomCard(
            title: 'Sede Chiloé',
            description: 'Descripción de Sede Chiloé.',
            imagePath: 'assets/Sede_Chiloe.jpg',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0), // Añade un poco de espacio alrededor del botón
            child: ElevatedButton(
              onPressed: () {
                //throw 'https://www.ulagos.cl';
              },
              child: const Text('Más Información'),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const CustomCard({Key? key, required this.title, required this.description, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0), // Añade espacio alrededor de cada tarjeta
      child: Column(
        mainAxisSize: MainAxisSize.min, // Hace que la columna ocupe el menor espacio posible
        children: <Widget>[
          Image.asset(imagePath, fit: BoxFit.cover), // Asegúrate de que las imágenes se ajusten bien
          ListTile(
            title: Text(title),
            subtitle: Text(description),
          ),
        ],
      ),
    );
  }
}
