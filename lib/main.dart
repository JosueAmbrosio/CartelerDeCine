import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue, // Azul como color primario
        scaffoldBackgroundColor: Colors.white, // Fondo blanco para la app
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'assets/images/cine_logo.png', // Logo del cine
                width: 150,  // Aumentamos el tamaño del logo
                height: 150,
              ),
              SizedBox(width: 10),
              Text(
                'Cartelera de Cine',
                style: TextStyle(
                  fontFamily: 'Kanit',  // Usamos la fuente Kanit para el título
                  fontSize: 24,
                  fontWeight: FontWeight.bold, // Aumentamos el grosor para destacar
                ),
              ),
            ],
          ),
          backgroundColor: Colors.blueAccent, // Azul claro para AppBar
          elevation: 5, // Elevación ligera
        ),
        body: MovieList(),
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies = [
    Movie(
      title: 'Soldados en la guerra',
      genre: 'Acción',
      price: 10.99,
      releaseDate: '2023-12-15',
      imageUrl: 'assets/images/warn.jpg',
    ),
    Movie(
      title: 'Héroe por encargo',
      genre: 'Aventura',
      price: 8.99,
      releaseDate: '2023-10-20',
      imageUrl: 'assets/images/heroe.jpg',
    ),
    Movie(
      title: 'Venom el Retorno',
      genre: 'Superhéroes',
      price: 12.99,
      releaseDate: '2023-11-05',
      imageUrl: 'assets/images/venom.jpg',
    ),
    Movie(
      title: 'Le comte de Montecristo',
      genre: 'Terror',
      price: 9.99,
      releaseDate: '2023-09-12',
      imageUrl: 'assets/images/conte.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return MovieCard(movie: movies[index]);
      },
    );
  }
}

class Movie {
  final String title;
  final String genre;
  final String releaseDate;
  final double price;
  final String imageUrl;

  const Movie({
    required this.title,
    required this.genre,
    required this.releaseDate,
    required this.price,
    required this.imageUrl,
  });
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10, // Más sombra para dar un toque profesional
      shadowColor: Colors.black.withOpacity(0.3), // Sombra más suave
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              movie.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title,
                  style: const TextStyle(
                    fontFamily: 'Itim', // Usamos la fuente Itim para el título de la película
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent, // Título en azul
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  movie.genre,
                  style: const TextStyle(
                    fontFamily: 'Itim', // También usamos 'Itim' para el género
                    fontSize: 16,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Precio: \$${movie.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontFamily: 'Itim', // Usamos 'Itim' también para los detalles
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      'Estreno: ${movie.releaseDate}',
                      style: const TextStyle(
                        fontFamily: 'Itim', // Usamos 'Itim' también para los detalles
                        fontSize: 16,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
