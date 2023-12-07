import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatefulWidget {
  const MiApp({super.key});

  @override
  _MiAppState createState() => _MiAppState();
}

class _MiAppState extends State<MiApp> {
  int _currentIndex = 0;
  final List<String> imgList = [
    'assets/Bulbasaur.png',
    'assets/Charmander.png',
    'assets/Squirtle.png',
    'assets/Vulpix.png',
    // Agrega aquí las rutas de tus imágenes locales
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mi App con Tabs'),
        ),
        body: _currentIndex == 0 
            ? Center( // Este Center centra el CarouselSlider verticalmente
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    height: MediaQuery.of(context).size.height * 0.4, // Altura del carrusel
                    viewportFraction: 0.9, // Fracción del viewport que cada imagen debe ocupar
                  ),
                  items: imgList.map((item) => Image.asset(item, fit: BoxFit.contain)).toList(),
                ),
              )
            : Center( // Contenido para la segunda página (Imagen y Botón)
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Centra los elementos en la columna
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 90, // Tamaño del avatar, ajusta según se necesite
                      backgroundImage: AssetImage('assets/Perfil.jpg'), // Ruta a la imagen de perfil
                    ),
                    const SizedBox(height: 20), // Espacio entre imagen y botón
                    ElevatedButton(
                      onPressed: () {
                        // Acción al presionar el botón
                      },
                      child: const Text('Editar Perfil'),
                    ),
                  ],
                ),
              ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: 'Carrusel',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Imagen y Botón',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}