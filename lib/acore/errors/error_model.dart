class ErrorModel {
  int? status;
  String? message;

  ErrorModel({this.message, this.status});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }
}
