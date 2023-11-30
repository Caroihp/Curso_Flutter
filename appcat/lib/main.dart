import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 240, 54, 224)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'App de Gatitos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Imagen desde una URL
            Image.network(
              'https://images.hola.com/imagenes/mascotas/20201104178485/consejos-gatos-para-principiantes/0-884-859/gatito-m.jpg?tx=w_680', // Reemplaza con la URL correcta
              width: 200,
              height: 200,
            ),

            // Espacio entre la imagen y el texto
            const SizedBox(height: 20),

            // Texto centrado
            const Text(
              'Me llamo Chispita',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 240, 54, 224),
              ),
            ),

            // Espacio entre el texto y el botón
            const SizedBox(height: 50),

            // Botón
            ElevatedButton(
              onPressed: () {
                // Acciones cuando se presiona el botón
                print('¡Has adoptado al gatito!');
              },
              child: const Text('¡Adoptame!'),
            ),
          ],
        ),
      ),
    );
  }
}
