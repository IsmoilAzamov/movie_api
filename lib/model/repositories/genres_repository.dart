import 'package:movie_api/core/base_service.dart';


import '../Genre.dart';
import '../services/genres_service.dart';

class GenresRepository{
final  BaseService _genresService=GenresService();
Future<List<Genre>> fetchGenres() async{
          dynamic response= await _genresService.getResponse("","");
          final data=response["genres"]as List;

          List<Genre> genres=data.map((e) => Genre.fromJson(e)).toList();

       return genres;
}
}