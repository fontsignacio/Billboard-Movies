import 'dart:async';
import 'package:billboard_movies/api/constants_api.dart';
import 'package:billboard_movies/medias/media_tv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HttpHandlerTv{
  final String _baseUrl = "api.themoviedb.org";
  final String _language = "en-US";

  Future<dynamic> getJson(Uri uri) async{
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

  Future<List<Media1>> fetchTv(){
    var uri = Uri.https(_baseUrl, "3/tv/popular",{
      'api_key' : API_KEY,
      'page' : "1",
      'language' : _language
    });     

    return getJson(uri).then((data) => 
      data['results'].map<Media1>((item) => Media1(item)).toList()
    );
  }

  Future<List<Media1>> fetchTvOnTheAir(){
    var uri = Uri.https(_baseUrl, "3/tv/on_the_air",{
      'api_key' : API_KEY,
      'page' : "1",
      'language' : _language
    });     

    return getJson(uri).then((data) => 
      data['results'].map<Media1>((item) => Media1(item)).toList()
    );
  }
  
  Future<List<Media1>> fetchTvTop(){
    var uri = Uri.https(_baseUrl, "3/tv/top_rated",{
      'api_key' : API_KEY,
      'page' : "1",
      'language' : _language
    });     

    return getJson(uri).then((data) => 
      data['results'].map<Media1>((item) => Media1(item)).toList()
    );
    
  }

}