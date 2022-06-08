import 'package:flutter/material.dart';
import 'package:movie_api/model/repositories/popular_repository.dart';

import '../core/api_response.dart';
import '../model/movie.dart';


class MainViewModel extends ChangeNotifier{
  ApiResponse _apiResponse=ApiResponse.initial("initial");

  List<Movie> _movies=[];

  List<Movie> get movies {
    return _movies;
  }
  ApiResponse get response{
    return _apiResponse;
  }

  Future fetPopular()async{
    try{
      List<Movie> movies= await PopularRepository().fetchPopular();
      _movies=movies;
      _apiResponse=ApiResponse.completed(movies);
    }
    catch (e){
    _apiResponse=ApiResponse.error(e.toString());
    }
    notifyListeners();
  }



}
