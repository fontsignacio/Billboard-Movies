import 'package:billboard_movies/common/util.dart';

class Media{
  int id;
  double voteAvarge;
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDate;
  bool video;
  List<dynamic> genreIds; 

  String getPosterUrl() => getMediumPictureUrl(posterPath);
  String getBackDropUrl() => getLargePictureUrl(backdropPath);
  String getGenres() => getGenreValues(genreIds);

  factory Media(Map jsonMap){
    try{
      return Media.deserialize(jsonMap);
    }catch(ex) {
      rethrow;
    }
  }

  Media.deserialize(Map json):
    id = json["id"].toInt(),
    voteAvarge = json["vote_average"].toDouble(),
    title = json["title"],
    posterPath = json["poster_path"] ?? "",
    backdropPath = json["backdrop_path"] ?? "",
    overview = json["overview"],
    releaseDate = json["release_date"],
    video = json["video"],
    genreIds = json["genre_ids"].toList();


}
