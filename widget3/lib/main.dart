import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() => runApp(CarouselDemo());

final themeMode = ValueNotifier(2);

class CarouselDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          initialRoute: '/',
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value as int],
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (ctx) => CarouselDemoHome(),
            '/complicated': (ctx) => ComplicatedImageDemo(),
          },
        );
      },
      valueListenable: themeMode,
    );
  }
}

class DemoItem extends StatelessWidget {
  final String title;
  final String route;
  DemoItem(this.title, this.route);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class CarouselDemoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
        actions: [
          IconButton(
              icon: Icon(Icons.nightlight_round),
              onPressed: () {
                themeMode.value = themeMode.value == 1 ? 2 : 1;
              })
        ],
      ),
      body: ListView(
        children: <Widget>[
          DemoItem('More complicated image slider', '/complicated'),
        ],
      ),
    );
  }
}

class ComplicatedImageDemo extends StatelessWidget {
  ComplicatedImageDemo({Key? key}) : super(key: key);

  // Suponiendo que esta es la estructura de tu lista de pokémon
  final List<Map<String, dynamic>> pokemonList = [
    {
      'name': 'Bulbasaur',
      'type': 'Planta',
      'imageUrl': 'assets/Bulbasaur.png',
      'number': '001' // Asegúrate de añadir el número de Pokedex
    },
    {
      'name': 'Charmander',
      'type': 'Fuego',
      'imageUrl': 'assets/Charmander.png',
      'number': '002' // Asegúrate de añadir el número de Pokedex
    },
    {
      'name': 'Squirtle',
      'type': 'Agua',
      'imageUrl': 'assets/Squirtle.png',
      'number': '003' // Asegúrate de añadir el número de Pokedex
    }
  ];

  @override
  Widget build(BuildContext context) {
    // Este valor es clave para controlar el tamaño de la tarjeta en el carrusel
    double viewportFractionValue = 0.75;

    List<Widget> pokemonSliders = pokemonList.map((pokemon) {
      // Configura el ancho de la tarjeta en función del ancho de la pantalla
      double cardWidth = MediaQuery.of(context).size.width * viewportFractionValue;

      return Container(
        width: cardWidth, // Ajusta el ancho de la tarjeta aquí
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Bordes redondeados
          ),
          elevation: 5, // Sombra de la tarjeta
          child: Column(
            mainAxisSize: MainAxisSize.min, // Asegura que la Columna no ocupe más espacio del necesario
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)), // Imagen con bordes redondeados en la parte superior
                child: Image.asset(pokemon['imageUrl'], fit: BoxFit.cover),
              ),
              Padding(
                padding: EdgeInsets.all(16.0), // Añade espacio alrededor del texto
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      pokemon['name'],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4), // Espacio entre el nombre y el tipo
                    Text(
                      'Tipo: ${pokemon['type']}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8), // Espacio entre el tipo y el número de Pokedex
                    Text(
                      'Pokedex: ${pokemon['number']}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Pokedex')),
      body: CarouselSlider(
        options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: true,
          aspectRatio: 2.0 / 1.0,
          viewportFraction: viewportFractionValue, // Usa la variable aquí
        ),
        items: pokemonSliders,
      ),
    );
  }
}

