import 'package:flutter/material.dart';
import 'package:movie_api/model/details.dart';

import '../core/api_response.dart';
import '../model/repositories/details_repository.dart';

class DetailsViewModel extends ChangeNotifier{

  ApiResponse _apiResponse=ApiResponse.initial("initial");

   Details? _details;



  ApiResponse get response{
    return _apiResponse;
  }

  Details? get details{
    return _details;
  }
  Future fetchDetailsById(int movieId, String pageNumber)async{
    try{
      Details details= await DetailsRepository().fetchDetails(movieId,  );
      _details=details;
      _apiResponse=ApiResponse.completed(details);
    }
    catch (e){
      _apiResponse=ApiResponse.error(e.toString());
    }
    notifyListeners();
  }


  void clearData(){
    _apiResponse=ApiResponse.initial("initial");
    _details=null;
  }


}