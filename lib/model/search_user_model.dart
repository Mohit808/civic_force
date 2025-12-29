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

/// id : 4
/// total_posts : 3
/// followers_count : 0
/// following_count : 2
/// name : "Base user"
/// email : "a@b.com"
/// phone_number : null
/// image : "https://i.pinimg.com/1200x/a3/50/60/a35060add776a578d4062d549ee1fb68.jpg"
/// user_id : 13

class Data {
  Data({
      num? id, 
      num? totalPosts, 
      num? followersCount, 
      num? followingCount, 
      String? name, 
      String? email, 
      dynamic phoneNumber, 
      String? image, 
      num? userId,}){
    _id = id;
    _totalPosts = totalPosts;
    _followersCount = followersCount;
    _followingCount = followingCount;
    _name = name;
    _email = email;
    _phoneNumber = phoneNumber;
    _image = image;
    _userId = userId;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _totalPosts = json['total_posts'];
    _followersCount = json['followers_count'];
    _followingCount = json['following_count'];
    _name = json['name'];
    _email = json['email'];
    _phoneNumber = json['phone_number'];
    _image = json['image'];
    _userId = json['user_id'];
  }
  num? _id;
  num? _totalPosts;
  num? _followersCount;
  num? _followingCount;
  String? _name;
  String? _email;
  dynamic _phoneNumber;
  String? _image;
  num? _userId;
Data copyWith({  num? id,
  num? totalPosts,
  num? followersCount,
  num? followingCount,
  String? name,
  String? email,
  dynamic phoneNumber,
  String? image,
  num? userId,
}) => Data(  id: id ?? _id,
  totalPosts: totalPosts ?? _totalPosts,
  followersCount: followersCount ?? _followersCount,
  followingCount: followingCount ?? _followingCount,
  name: name ?? _name,
  email: email ?? _email,
  phoneNumber: phoneNumber ?? _phoneNumber,
  image: image ?? _image,
  userId: userId ?? _userId,
);
  num? get id => _id;
  num? get totalPosts => _totalPosts;
  num? get followersCount => _followersCount;
  num? get followingCount => _followingCount;
  String? get name => _name;
  String? get email => _email;
  dynamic get phoneNumber => _phoneNumber;
  String? get image => _image;
  num? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['total_posts'] = _totalPosts;
    map['followers_count'] = _followersCount;
    map['following_count'] = _followingCount;
    map['name'] = _name;
    map['email'] = _email;
    map['phone_number'] = _phoneNumber;
    map['image'] = _image;
    map['user_id'] = _userId;
    return map;
  }

}