import 'package:civic_force/model/user_model.dart';

/// message : "Comments fetched successfully."
/// status : 200
/// data : [{"id":7,"user":{"id":3,"name":"Amit","email":"amit@gmail.com","profile_picture":null,"user_id":17},"text":"hc","created_at":"2025-12-04T08:11:08.966271Z","post":37,"reply_count":0,"is_liked":false},{"id":6,"user":{"id":3,"name":"Amit","email":"amit@gmail.com","profile_picture":null,"user_id":17},"text":"jv","created_at":"2025-12-04T08:10:20.246235Z","post":37,"reply_count":0,"is_liked":false},{"id":5,"user":{"id":3,"name":"Amit","email":"amit@gmail.com","profile_picture":null,"user_id":17},"text":"bc","created_at":"2025-12-04T08:10:04.366335Z","post":37,"reply_count":0,"is_liked":false},{"id":4,"user":{"id":3,"name":"Amit","email":"amit@gmail.com","profile_picture":null,"user_id":17},"text":"hchchc","created_at":"2025-12-04T08:09:51.618073Z","post":37,"reply_count":0,"is_liked":false},{"id":3,"user":{"id":3,"name":"Amit","email":"amit@gmail.com","profile_picture":null,"user_id":17},"text":"zhi","created_at":"2025-12-04T08:09:29.716189Z","post":37,"reply_count":0,"is_liked":false},{"id":2,"user":{"id":2,"name":"Vuh. H","email":"qwerty@gmail.com","profile_picture":null,"user_id":19},"text":"ertyu","created_at":"2025-12-04T08:07:05.293120Z","post":37,"reply_count":0,"is_liked":false},{"id":1,"user":{"id":1,"name":"Amit Yadav","email":null,"profile_picture":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoFRQjM-wM_nXMA03AGDXgJK3VeX7vtD3ctA&s","user_id":3},"text":"Readme\r\nChangelog\r\nExample\r\nInstalling\r\nVersions\r\nScores\r\nFlutter Geocoding Plugin \r\npub package License: MIT style: effective dart Buid status codecov\r\n\r\nA Flutter Geocoding plugin which provides easy geocoding and reverse-geocoding features.\r\n\r\nImportant:\r\n\r\nThis plugin uses the free Geocoding services provided by the iOS and Android platforms. This means that there are restrictions to their use. More information can be found in the Apple documentation for iOS and the Google documentation for Android. When a PlatformException(IO_ERROR, ...) gets thrown, most of the times it means that the rate limit has been reached.\r\nThe availability of the Google Play Services depends on your country. If your country doesn't support a connection with the Google Play Services, you'll need to try a VPN to establish a connection. For more information about how to work with Google Play Services visit the following link: https://developers.google.com/android/guides/overview","created_at":"2025-12-04T07:56:12.676768Z","post":37,"reply_count":1,"is_liked":false}]

class CommentModel {
  CommentModel({
      String? message, 
      num? status, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  CommentModel.fromJson(dynamic json) {
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
CommentModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => CommentModel(  message: message ?? _message,
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

/// id : 7
/// user : {"id":3,"name":"Amit","email":"amit@gmail.com","profile_picture":null,"user_id":17}
/// text : "hc"
/// created_at : "2025-12-04T08:11:08.966271Z"
/// post : 37
/// reply_count : 0
/// is_liked : false

class Data {
  Data({
      num? id, 
      UserInfo? user, 
      String? text, 
      String? createdAt, 
      num? post, 
      num? replyCount, 
      bool? isLiked,}){
    _id = id;
    _user = user;
    _text = text;
    _createdAt = createdAt;
    _post = post;
    _replyCount = replyCount;
    _isLiked = isLiked;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _user = json['user'] != null ? UserInfo.fromJson(json['user']) : null;
    _text = json['text'];
    _createdAt = json['created_at'];
    _post = json['post'];
    _replyCount = json['reply_count'];
    _isLiked = json['is_liked'];
  }
  num? _id;
  UserInfo? _user;
  String? _text;
  String? _createdAt;
  num? _post;
  num? _replyCount;
  bool? _isLiked;
Data copyWith({  num? id,
  UserInfo? user,
  String? text,
  String? createdAt,
  num? post,
  num? replyCount,
  bool? isLiked,
}) => Data(  id: id ?? _id,
  user: user ?? _user,
  text: text ?? _text,
  createdAt: createdAt ?? _createdAt,
  post: post ?? _post,
  replyCount: replyCount ?? _replyCount,
  isLiked: isLiked ?? _isLiked,
);
  num? get id => _id;
  UserInfo? get user => _user;
  String? get text => _text;
  String? get createdAt => _createdAt;
  num? get post => _post;
  num? get replyCount => _replyCount;
  bool? get isLiked => _isLiked;

  setReplyCount(value){
    _replyCount=value;
  }
  setLiked(bool value){
    _isLiked=value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['text'] = _text;
    map['created_at'] = _createdAt;
    map['post'] = _post;
    map['reply_count'] = _replyCount;
    map['is_liked'] = _isLiked;
    return map;
  }

}
