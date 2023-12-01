import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Pokemon> pokemons = [
    Pokemon(name: 'Bulbasaur', type: 'Planta', number: 1, imagePath: 'assets/bulbasaur.png'),
    Pokemon(name: 'Charmander', type: 'Fuego', number: 4, imagePath: 'assets/charmander.png'),
    Pokemon(name: 'Squirtle', type: 'Agua', number: 7, imagePath: 'assets/squirtle.png'),
    Pokemon(name: 'Vulpix', type: 'Fuego', number: 37, imagePath: 'assets/vulpix.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: Center(
        child: CarouselSlider.builder(
          itemCount: pokemons.length,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
            return PokemonCard(pokemon: pokemons[itemIndex]);
          },
          options: CarouselOptions(
            height: 400.0,
            enlargeCenterPage: true,
            autoPlay: false,
            aspectRatio: 16/9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),
      ),
    );
  }
}

class Pokemon {
  final String name;
  final String type;
  final int number;
  final String imagePath;

  Pokemon({required this.name, required this.type, required this.number, required this.imagePath});
}

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded( // La imagen tomará todo el espacio vertical disponible restante
            child: Image.asset(pokemon.imagePath, fit: BoxFit.contain),
          ),
          ListTile(
            title: Text(pokemon.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Pokedex: ${pokemon.number}'),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              padding: const EdgeInsets.all(8),
              color: _getTypeColor(pokemon.type),
              child: Text('Tipo: ${pokemon.type}', style: const TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'Planta':
        return Colors.green;
      case 'Fuego':
        return Colors.orange;
      case 'Agua':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}