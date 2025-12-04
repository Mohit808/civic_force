/// message : "Post liked successfully."
/// status : 200
/// data : {"like":true}

class LikeModel {
  LikeModel({
      String? message, 
      num? status, 
      Data? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  LikeModel.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _message;
  num? _status;
  Data? _data;
LikeModel copyWith({  String? message,
  num? status,
  Data? data,
}) => LikeModel(  message: message ?? _message,
  status: status ?? _status,
  data: data ?? _data,
);
  String? get message => _message;
  num? get status => _status;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// like : true

class Data {
  Data({
      bool? like,}){
    _like = like;
}

  Data.fromJson(dynamic json) {
    _like = json['like'];
  }
  bool? _like;
Data copyWith({  bool? like,
}) => Data(  like: like ?? _like,
);
  bool? get like => _like;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['like'] = _like;
    return map;
  }

}