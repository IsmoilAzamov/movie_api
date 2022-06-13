import 'package:movie_api/core/base_service.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_api/model/services/popular_service.dart';

class PopularRepository{
final  BaseService _popularService=PopularService();
Future<List<Movie>> fetchPopular(String pageNumber) async{
          dynamic response= await _popularService.getResponse("/popular", pageNumber);
          final data=response["results"]as List;

          List<Movie> movies=data.map((e) => Movie.fromJson(e)).toList();

          return movies;
}
}