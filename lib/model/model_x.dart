
class ModelX {
  ModelX({
      String? message, 
      num? status, 
      dynamic data,}){
    _message = message;
    _status = status;
    _data = data;
}

  ModelX.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _data = json['data'];
  }
  String? _message;
  num? _status;
  dynamic _data;
ModelX copyWith({  String? message,
  num? status,
  dynamic data,
}) => ModelX(  message: message ?? _message,
  status: status ?? _status,
  data: data ?? _data,
);
  String? get message => _message;
  num? get status => _status;
  dynamic get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    map['data'] = _data;
    return map;
  }

}