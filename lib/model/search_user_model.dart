
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
/// profile_picture : null
/// user_id : 3

class Data {
  Data({
      num? id, 
      dynamic name, 
      dynamic profilePicture, 
      num? userId,}){
    _id = id;
    _name = name;
    _profilePicture = profilePicture;
    _userId = userId;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _profilePicture = json['profile_picture'];
    _userId = json['user_id'];
  }
  num? _id;
  dynamic _name;
  dynamic _profilePicture;
  num? _userId;
Data copyWith({  num? id,
  dynamic name,
  dynamic profilePicture,
  num? userId,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  profilePicture: profilePicture ?? _profilePicture,
  userId: userId ?? _userId,
);
  num? get id => _id;
  dynamic get name => _name;
  dynamic get profilePicture => _profilePicture;
  num? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['profile_picture'] = _profilePicture;
    map['user_id'] = _userId;
    return map;
  }

}