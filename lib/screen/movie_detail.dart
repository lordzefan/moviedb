import 'package:flutter/material.dart';
import '../model/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie selectedMovie;

  const MovieDetail({Key? key,required this.selectedMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String path;
    double screenHeight = MediaQuery.of(context).size.height;
    if (selectedMovie.posterPath != null) {
      path = 'https://image.tmdb.org/t/p/w500/${selectedMovie.posterPath}';
    } else {
      path =
      'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMovie.title}'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                height: screenHeight / 1.5,
                child: Image.network(path),
              ),
              Text('${selectedMovie.overview}'),

              // Row for Rating and Release
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end, // Aligns to the bottom of the row
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Rating: ${selectedMovie.voteAverage}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Release: ${selectedMovie.releaseDate}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right, // Aligns the text to the right within its space
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      //bar untuk nama dan nim
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue, // Ganti warna bottom bar sesuai keinginan
        child: Container(
          padding: EdgeInsets.all(8),
          child: Text(
            'Created by\nNama: Zefanya Wicaksono Rihindia\nNIM: 21201066',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white, // Ganti warna teks sesuai keinginan
            ),
          ),
        ),
      ),
    );
  }
}
