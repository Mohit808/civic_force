
class SearchUserModel {
  SearchUserModel({
      String? message, 
      num? status, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  SearchUserModel.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _message;
  num? _status;
  List<Data>? _data;
SearchUserModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => SearchUserModel(  message: message ?? _message,
  status: status ?? _status,
  data: data ?? _data,
);
  String? get message => _message;
  num? get status => _status;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : null
/// image : null
/// user_id : 3

class Data {
  Data({
      num? id, 
      dynamic name, 
      dynamic image,
      num? userId,}){
    _id = id;
    _name = name;
    _image = image;
    _userId = userId;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _userId = json['user_id'];
  }
  num? _id;
  dynamic _name;
  dynamic _image;
  num? _userId;
Data copyWith({  num? id,
  dynamic name,
  dynamic image,
  num? userId,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  userId: userId ?? _userId,
);
  num? get id => _id;
  dynamic get name => _name;
  dynamic get image => _image;
  num? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['user_id'] = _userId;
    return map;
  }

}