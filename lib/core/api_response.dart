// ignore_for_file: constant_identifier_names

class ApiResponse<T>{
  Status status;
  T? data;
  String? messagae;

  ApiResponse.initial(this.messagae):status=Status.INITIAL;
  ApiResponse.loading(this.messagae):status=Status.LOADING;
  ApiResponse.completed(this.data):status=Status.COMPLETED;
  ApiResponse.error(this.messagae):status=Status.ERROR;

}

enum Status {
  INITIAL,
  ERROR,
  LOADING,
  COMPLETED,
}