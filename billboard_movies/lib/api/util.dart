const String _imageUrlMedium = "https://image.tmdb.org/t/p/w300";
const String _imageUrlLarge = "https://image.tmdb.org/t/p/w500";

String getMediumPictureUrl(String path) => _imageUrlMedium + path;
String getLargePictureUrl(String path) => _imageUrlLarge + path;

Map<int,String> _genreMap = {
  28: 'Action',
  12: 'Adventure',
  16: 'Animation',
  35: 'Comedy',
  80: 'Crime',
  99: 'Documentary',
  18: 'Drama',
  10751: 'Family',
  14: 'Fantasy',
  36: 'History',
  27: 'Horror',
  10402: 'Music',
  9648: 'Mystery',
  10749: 'Romance',
  878: 'Science Fiction',
  10770: 'TV Movie',
  53: 'Thriller',
  10752: 'War',
  37: 'Western',  
};

List<String> genre = [
      'Action',
      'Adventure',
      'Animation',
      'Comedy',
      'Crime',
      'Documentary',
      'Drama',
      'Family',
      'Fantasy',
      'History',
      'Horror',
      'Music',
      'Mystery',
      'Romance',
      'Science Fiction',
      'TV Movie',
      'Thriller',
      'War',
      'Western',  
];

List<String?> generesToList(List<dynamic> genreIds) =>
genreIds.map((id) => _genreMap[id]).toList();

String getGenreValues(List<dynamic> genreIds){
  StringBuffer buffer = StringBuffer();
  buffer.writeAll(generesToList(genreIds), ", ");
  return buffer.toString();
}