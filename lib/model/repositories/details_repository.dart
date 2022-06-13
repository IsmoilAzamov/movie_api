import 'package:movie_api/core/base_service.dart';
import 'package:movie_api/model/services/details_service.dart';
import '../details.dart';


class DetailsRepository {
  final BaseService _detailsService = DetailsService();
  Future<Details> fetchDetails(int movieId ) async {
    dynamic response = await _detailsService.getResponse("/$movieId","");
    final details = Details.fromJson(response);

    return details;
  }
}
