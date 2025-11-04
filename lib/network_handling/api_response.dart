class ApiResponse <T>{
  Status status;
  T? data;
  String? message;

  ApiResponse({required this.status, this.data, this.message});

  ApiResponse.loading(this.message) : status =Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.message) : status = Status.ERROR;
  ApiResponse.internetError(this.message) : status = Status.INTERNETERROR;
  ApiResponse.exhaust(this.message) : status = Status.EXHAUST;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }

}

enum Status { INITIAL,LOADING, COMPLETED, ERROR,INTERNETERROR,EXHAUST }