import 'package:flutter/material.dart';
import 'package:movie_api/model/Genre.dart';
import 'package:movie_api/model/repositories/genres_repository.dart';
import 'package:movie_api/model/repositories/popular_repository.dart';

import '../core/api_response.dart';
import '../model/movie.dart';


class MainViewModel extends ChangeNotifier{
  ApiResponse _apiResponse=ApiResponse.initial("initial");

  List<Movie> _movies=[];
  List<Genre> _genres=[];
   int page=1;

  List<Genre> get genres{
    return _genres;
  }

  List<Movie> get movies {
    return _movies;
  }
  ApiResponse get response{
    return _apiResponse;
  }

  Future fetchPopular()async{
    try{
      List<Movie> movies= await PopularRepository().fetchPopular("&page=$page");
      _movies=movies;
      _apiResponse=ApiResponse.completed(movies);
    }
    catch (e){
    _apiResponse=ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

Future fetchGenres()async{
  try{
    List<Genre> genres= await GenresRepository().fetchGenres();
    _genres=genres;
    _apiResponse=ApiResponse.completed(genres);
  }
  catch (e){
    debugPrint(e.toString());
  }
  notifyListeners();
}
Future nextPage()async{
    page=page+1;
  try{
    List<Movie> movies= await PopularRepository().fetchPopular("&page=$page");
    _movies=movies;
    _apiResponse=ApiResponse.completed(movies);
  }
  catch (e){
    _apiResponse=ApiResponse.error(e.toString());
  }

  notifyListeners();


}
  Future lastPage()async{
    if(page>1) {
      page=page-1;
    }
    try{
      List<Movie> movies= await PopularRepository().fetchPopular("&page=$page");
      _movies=movies;
      _apiResponse=ApiResponse.completed(movies);
    }
    catch (e){
      _apiResponse=ApiResponse.error(e.toString());
    }

    notifyListeners();


  }
}
