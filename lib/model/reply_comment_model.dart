
import 'package:civic_force/model/user_model.dart';

class ReplyCommentModel {
  ReplyCommentModel({
      String? message, 
      num? status, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  ReplyCommentModel.fromJson(dynamic json) {
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
ReplyCommentModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => ReplyCommentModel(  message: message ?? _message,
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
/// user : {"id":1,"name":"Amit Yadav","email":null,"image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoFRQjM-wM_nXMA03AGDXgJK3VeX7vtD3ctA&s","user_id":3}
/// comment : {"id":1,"user":{"id":1,"name":"Amit Yadav","email":null,"image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoFRQjM-wM_nXMA03AGDXgJK3VeX7vtD3ctA&s","user_id":3},"text":"Readme\r\nChangelog\r\nExample\r\nInstalling\r\nVersions\r\nScores\r\nFlutter Geocoding Plugin \r\npub package License: MIT style: effective dart Buid status codecov\r\n\r\nA Flutter Geocoding plugin which provides easy geocoding and reverse-geocoding features.\r\n\r\nImportant:\r\n\r\nThis plugin uses the free Geocoding services provided by the iOS and Android platforms. This means that there are restrictions to their use. More information can be found in the Apple documentation for iOS and the Google documentation for Android. When a PlatformException(IO_ERROR, ...) gets thrown, most of the times it means that the rate limit has been reached.\r\nThe availability of the Google Play Services depends on your country. If your country doesn't support a connection with the Google Play Services, you'll need to try a VPN to establish a connection. For more information about how to work with Google Play Services visit the following link: https://developers.google.com/android/guides/overview","created_at":"2025-12-04T07:56:12.676768Z","post":37}
/// text : "Hello"
/// created_at : "2025-12-04T09:51:04.016802Z"

class Data {
  Data({
      num? id,
      UserInfo? user,
      Comment? comment, 
      String? text, 
      String? createdAt,}){
    _id = id;
    _user = user;
    _comment = comment;
    _text = text;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _user = json['user'] != null ? UserInfo.fromJson(json['user']) : null;
    _comment = json['comment'] != null ? Comment.fromJson(json['comment']) : null;
    _text = json['text'];
    _createdAt = json['created_at'];
  }
  num? _id;
  UserInfo? _user;
  Comment? _comment;
  String? _text;
  String? _createdAt;
Data copyWith({  num? id,
  UserInfo? user,
  Comment? comment,
  String? text,
  String? createdAt,
}) => Data(  id: id ?? _id,
  user: user ?? _user,
  comment: comment ?? _comment,
  text: text ?? _text,
  createdAt: createdAt ?? _createdAt,
);
  num? get id => _id;
  UserInfo? get user => _user;
  Comment? get comment => _comment;
  String? get text => _text;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_comment != null) {
      map['comment'] = _comment?.toJson();
    }
    map['text'] = _text;
    map['created_at'] = _createdAt;
    return map;
  }

}

/// id : 1
/// user : {"id":1,"name":"Amit Yadav","email":null,"image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoFRQjM-wM_nXMA03AGDXgJK3VeX7vtD3ctA&s","user_id":3}
/// text : "Readme\r\nChangelog\r\nExample\r\nInstalling\r\nVersions\r\nScores\r\nFlutter Geocoding Plugin \r\npub package License: MIT style: effective dart Buid status codecov\r\n\r\nA Flutter Geocoding plugin which provides easy geocoding and reverse-geocoding features.\r\n\r\nImportant:\r\n\r\nThis plugin uses the free Geocoding services provided by the iOS and Android platforms. This means that there are restrictions to their use. More information can be found in the Apple documentation for iOS and the Google documentation for Android. When a PlatformException(IO_ERROR, ...) gets thrown, most of the times it means that the rate limit has been reached.\r\nThe availability of the Google Play Services depends on your country. If your country doesn't support a connection with the Google Play Services, you'll need to try a VPN to establish a connection. For more information about how to work with Google Play Services visit the following link: https://developers.google.com/android/guides/overview"
/// created_at : "2025-12-04T07:56:12.676768Z"
/// post : 37

class Comment {
  Comment({
      num? id,
    UserInfo? user,
      String? text, 
      String? createdAt, 
      num? post,}){
    _id = id;
    _user = user;
    _text = text;
    _createdAt = createdAt;
    _post = post;
}

  Comment.fromJson(dynamic json) {
    _id = json['id'];
    _user = json['user'] != null ? UserInfo.fromJson(json['user']) : null;
    _text = json['text'];
    _createdAt = json['created_at'];
    _post = json['post'];
  }
  num? _id;
  UserInfo? _user;
  String? _text;
  String? _createdAt;
  num? _post;
Comment copyWith({  num? id,
  UserInfo? user,
  String? text,
  String? createdAt,
  num? post,
}) => Comment(  id: id ?? _id,
  user: user ?? _user,
  text: text ?? _text,
  createdAt: createdAt ?? _createdAt,
  post: post ?? _post,
);
  num? get id => _id;
  UserInfo? get user => _user;
  String? get text => _text;
  String? get createdAt => _createdAt;
  num? get post => _post;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['text'] = _text;
    map['created_at'] = _createdAt;
    map['post'] = _post;
    return map;
  }

}
