abstract class BaseService{
  final String apiKey='?api_key=1ddd4d52fdb57b7d6b7f2059d6d6d975';
  final String baseUrl='https://api.themoviedb.org/3/movie';
  final String genreUrl='https://api.themoviedb.org/3/genre/movie/list';

  Future<dynamic> getResponse(String url, String pageNumber);
}