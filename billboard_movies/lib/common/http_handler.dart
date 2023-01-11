import 'dart:async';
import 'package:billboard_movies/common/constants_api.dart';
import 'package:billboard_movies/model/media.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHandler{
  final String _baseUrl = "api.themoviedb.org";
  final String _language = "en-US";

  Future<dynamic> getJson(Uri uri) async{
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

  Future<List<Media>> fetchMovies(){
    var uri = Uri.https(_baseUrl, "3/movie/popular",{
      'api_key' : API_KEY,
      'page' : "1",
      'language' : _language
    });     

    return getJson(uri).then((data) => 
      data['results'].map<Media>((item) => Media(item)).toList()
    );
  }

  Future<List<Media>> fetchUpcoming(){
    var uri = Uri.https(_baseUrl, "3/movie/upcoming",{
      'api_key' : API_KEY,
      'page' : "1",
      'language' : _language
    });     

    return getJson(uri).then((data) => 
      data['results'].map<Media>((item) => Media(item)).toList()
    );
  }
  
  Future<List<Media>> fetchTop(){
    var uri = Uri.https(_baseUrl, "3/movie/top_rated",{
      'api_key' : API_KEY,
      'page' : "1",
      'language' : _language
    });     

    return getJson(uri).then((data) => 
      data['results'].map<Media>((item) => Media(item)).toList()
    );
  }

  Future<List<Media>> fetchTv(){
    var uri = Uri.https(_baseUrl, "3/tv/popular",{
      'api_key' : API_KEY,
      'page' : "1",
      'language' : _language
    });     

    return getJson(uri).then((data) => 
      data['results'].map<Media>((item) => Media(item)).toList()
    );
  }

  Future<List<Media>> fetchTvLatest(){
    var uri = Uri.https(_baseUrl, "3/tv/latest",{
      'api_key' : API_KEY,
      'page' : "1",
      'language' : _language
    });     

    return getJson(uri).then((data) => 
      data['results'].map<Media>((item) => Media(item)).toList()
    );
  }
  
  Future<List<Media>> fetchTvTop(){
    var uri = Uri.https(_baseUrl, "3/tv/top_rated",{
      'api_key' : API_KEY,
      'page' : "1",
      'language' : _language
    });     

    return getJson(uri).then((data) => 
      data['results'].map<Media>((item) => Media(item)).toList()
    );
  }


}

