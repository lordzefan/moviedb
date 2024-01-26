import 'dart:io';
import '../model/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper{
  final String urlKey = 'api_key=874efddd4d796fa1cefd70320eb8d4b9';
  final String urlBase ='https://api.themoviedb.org/3/movie';
  final String urlUpcoming ='/upcoming?';
  final String urlLanguage ='&language=en-US';
  final String urlSearchBase = 'https://api.themoviedb.org/3/search/movie?''api_key=3fd91295d03703ff8f198a3b0bcd55aa&query=';
  final String urlTopRated = 'https://api.themoviedb.org/3/movie/top_rated?api_key=3fd91295d03703ff8f198a3b0bcd55aa';


  Future<String> getUpcoming() async{
    final Uri upcoming = Uri.parse(urlBase + urlUpcoming + urlKey + urlLanguage);

    http.Response result = await http.get(upcoming);
    if(result.statusCode == HttpStatus.ok){
      String responseBody = result.body;
      return responseBody;
    }else{
      return '{}';
    }
  }

  Future<List> getUpComingAsList() async {
    final Uri upcoming = Uri.parse(urlBase+ urlUpcoming+ urlKey+ urlLanguage);
    http.Response result = await http.get(upcoming);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponseBody = json.decode(result.body);
      final movieObjects = jsonResponseBody['results'];
      List movies = movieObjects.map((json) => Movie.fromJson(json)).toList();

      return movies;
    }else{
      return [];
    }
  }

  Future<List> findMovies(String title) async {
    final Uri query = Uri.parse(urlSearchBase + title);
    http.Response hasilCari = await http.get(query);
    if (hasilCari.statusCode == HttpStatus.ok){
      final jsonResponseBody = json.decode(hasilCari.body);
      final movieObjects = jsonResponseBody['results'];
      List movies = movieObjects.map((json) => Movie.fromJson(json)).toList();
      return movies;
    }else{
      return [];
    }
  }

  Future<List> getTopRatedAsList() async {
    final Uri topRated = Uri.parse(urlTopRated);
    http.Response result = await http.get(topRated);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponseBody = json.decode(result.body);
      final movieObjects = jsonResponseBody['results'];
      List movies = movieObjects.map((json) => Movie.fromJson(json)).toList();

      return movies;
    }else{
      return [];
    }
  }
}




