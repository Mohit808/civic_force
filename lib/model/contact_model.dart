class ContactModel {
  ContactModel({
      String? message, 
      num? status, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  ContactModel.fromJson(dynamic json) {
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
ContactModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => ContactModel(  message: message ?? _message,
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

/// id : 9
/// user : "13"
/// name : "My App Tester"
/// number : "+919876543210"
/// added_at : "2025-12-29T10:07:33.430505Z"
/// registered_name : "Amit"
/// registered_user_id : 17
/// registered_image : "https://i.pinimg.com/736x/6f/23/69/6f2369ceaaae518948039cba0479b948.jpg"

class Data {
  Data({
      num? id, 
      String? user, 
      String? name, 
      String? number, 
      String? addedAt, 
      String? registeredName, 
      num? registeredUserId, 
      String? registeredImage,}){
    _id = id;
    _user = user;
    _name = name;
    _number = number;
    _addedAt = addedAt;
    _registeredName = registeredName;
    _registeredUserId = registeredUserId;
    _registeredImage = registeredImage;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _user = json['user'];
    _name = json['name'];
    _number = json['number'];
    _addedAt = json['added_at'];
    _registeredName = json['registered_name'];
    _registeredUserId = json['registered_user_id'];
    _registeredImage = json['registered_image'];
  }
  num? _id;
  String? _user;
  String? _name;
  String? _number;
  String? _addedAt;
  String? _registeredName;
  num? _registeredUserId;
  String? _registeredImage;
Data copyWith({  num? id,
  String? user,
  String? name,
  String? number,
  String? addedAt,
  String? registeredName,
  num? registeredUserId,
  String? registeredImage,
}) => Data(  id: id ?? _id,
  user: user ?? _user,
  name: name ?? _name,
  number: number ?? _number,
  addedAt: addedAt ?? _addedAt,
  registeredName: registeredName ?? _registeredName,
  registeredUserId: registeredUserId ?? _registeredUserId,
  registeredImage: registeredImage ?? _registeredImage,
);
  num? get id => _id;
  String? get user => _user;
  String? get name => _name;
  String? get number => _number;
  String? get addedAt => _addedAt;
  String? get registeredName => _registeredName;
  num? get registeredUserId => _registeredUserId;
  String? get registeredImage => _registeredImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user'] = _user;
    map['name'] = _name;
    map['number'] = _number;
    map['added_at'] = _addedAt;
    map['registered_name'] = _registeredName;
    map['registered_user_id'] = _registeredUserId;
    map['registered_image'] = _registeredImage;
    return map;
  }

}