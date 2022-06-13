import 'dart:convert';
import 'dart:io';
import 'package:movie_api/core/app_exception.dart';
import 'package:movie_api/core/base_service.dart';
import 'package:http/http.dart' as http;

class DetailsService extends BaseService{
  dynamic responseJson;

  @override
  Future getResponse(String url,String pageNumber ) async{
    try{
      final response=await http.get(Uri.parse(baseUrl+url+apiKey));

      responseJson= returnResponse(response);

    } on SocketException{
      throw Exception("Internet error");
    }
    return responseJson;
  }
  dynamic returnResponse(http.Response response){
    switch (response.statusCode){
      case 200:
        dynamic responseJson=jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.statusCode.toString());
      case 401:
        throw UnauthorizedException(response.statusCode.toString());
      case 404:
        throw NotFoundException(response.statusCode.toString());
      default: Exception(response.statusCode.toString());
    }
  }

}