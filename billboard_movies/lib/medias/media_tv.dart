import 'package:billboard_movies/api/util.dart';

class Media1{
  int id;
  double voteAvarge;
  String name;
  String posterPath;
  String backdropPath;
  String overview;
  String firstDate;
  List<dynamic> genreIds; 

  String getPosterUrl() => getMediumPictureUrl(posterPath);
  String getBackDropUrl() => getLargePictureUrl(backdropPath);
  String getGenres() => getGenreValues(genreIds);

  factory Media1(Map jsonMap){
    try{
      return Media1.deserialize(jsonMap);
    }catch(ex) {
      rethrow;
    }
  }

  Media1.deserialize(Map json):
    id = json["id"].toInt(),
    voteAvarge = json["vote_average"].toDouble(),
    name = json["name"],
    posterPath = json["poster_path"] ?? "",
    backdropPath = json["backdrop_path"] ?? "",
    overview = json["overview"],
    firstDate = json["first_air_date"],
    genreIds = json["genre_ids"].toList(); 

}