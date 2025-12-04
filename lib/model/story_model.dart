import 'package:civic_force/model/user_model.dart';

class StoryModel {
  StoryModel({
      String? message, 
      num? status, 
      Data? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  StoryModel.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _message;
  num? _status;
  Data? _data;
StoryModel copyWith({  String? message,
  num? status,
  Data? data,
}) => StoryModel(  message: message ?? _message,
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

/// myStories : [{"id":4,"user":{"id":2,"phone_number":"8858459011","name":null,"image":null,"email":null,"fcm_token":null,"public_key":null,"created_at":"2025-11-12T07:04:16.283753Z","user_id":4},"media_url":"https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251112064023_1000000506.jpg","media_type":"image","created_at":"2025-11-12T07:04:21.505255Z","expires_at":"2025-11-13T07:04:21.504959Z"}]
/// stories : [{"id":3,"user":{"id":1,"phone_number":"9876543210","name":"Oops","image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyWLjkYKGswBE2f9mynFkd8oPT1W4Gx8RpDQ&s","email":null,"fcm_token":"d89WglETRyKisp--zGbMUG:APA91bEADq2ACwCgH7KI8XN4VTswQlvkzu4KzimBdVhmCm1LIf_qahjj4IhAxz3UqydOnO5RbLlBwrlx7QNIQS_DAXljAxAdUpV6Sa8k5liKq-6s75LPRJg","public_key":"aNOXFEE7MPXCNGx3rij/GQQ8+FHBOejUjacTGhCbbgE=","created_at":"2025-11-12T06:15:03.259317Z","user_id":3},"media_url":"https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251112065251_1000000493.jpg","media_type":"image","created_at":"2025-11-12T06:52:51.937916Z","expires_at":"2025-11-13T06:52:51.937564Z"},{"id":2,"user":{"id":1,"phone_number":"9876543210","name":"Oops","image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyWLjkYKGswBE2f9mynFkd8oPT1W4Gx8RpDQ&s","email":null,"fcm_token":"d89WglETRyKisp--zGbMUG:APA91bEADq2ACwCgH7KI8XN4VTswQlvkzu4KzimBdVhmCm1LIf_qahjj4IhAxz3UqydOnO5RbLlBwrlx7QNIQS_DAXljAxAdUpV6Sa8k5liKq-6s75LPRJg","public_key":"aNOXFEE7MPXCNGx3rij/GQQ8+FHBOejUjacTGhCbbgE=","created_at":"2025-11-12T06:15:03.259317Z","user_id":3},"media_url":"https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251112064623_1000000501.jpg","media_type":"image","created_at":"2025-11-12T06:46:24.043792Z","expires_at":"2025-11-13T06:46:24.043431Z"},{"id":1,"user":{"id":1,"phone_number":"9876543210","name":"Oops","image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyWLjkYKGswBE2f9mynFkd8oPT1W4Gx8RpDQ&s","email":null,"fcm_token":"d89WglETRyKisp--zGbMUG:APA91bEADq2ACwCgH7KI8XN4VTswQlvkzu4KzimBdVhmCm1LIf_qahjj4IhAxz3UqydOnO5RbLlBwrlx7QNIQS_DAXljAxAdUpV6Sa8k5liKq-6s75LPRJg","public_key":"aNOXFEE7MPXCNGx3rij/GQQ8+FHBOejUjacTGhCbbgE=","created_at":"2025-11-12T06:15:03.259317Z","user_id":3},"media_url":"https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251112064023_1000000506.jpg","media_type":"image","created_at":"2025-11-12T06:44:02.023144Z","expires_at":"2025-11-13T06:44:02.022806Z"}]

class Data {
  Data({
      List<Stories>? myStories,
      List<Stories>? stories,}){
    _myStories = myStories;
    _stories = stories;
}

  Data.fromJson(dynamic json) {
    if (json['myStories'] != null) {
      _myStories = [];
      json['myStories'].forEach((v) {
        _myStories?.add(Stories.fromJson(v));
      });
    }
    if (json['stories'] != null) {
      _stories = [];
      json['stories'].forEach((v) {
        _stories?.add(Stories.fromJson(v));
      });
    }
  }
  List<Stories>? _myStories;
  List<Stories>? _stories;
Data copyWith({  List<Stories>? myStories,
  List<Stories>? stories,
}) => Data(  myStories: myStories ?? _myStories,
  stories: stories ?? _stories,
);
  List<Stories>? get myStories => _myStories;
  List<Stories>? get stories => _stories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_myStories != null) {
      map['myStories'] = _myStories?.map((v) => v.toJson()).toList();
    }
    if (_stories != null) {
      map['stories'] = _stories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// user : {"id":1,"phone_number":"9876543210","name":"Oops","image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyWLjkYKGswBE2f9mynFkd8oPT1W4Gx8RpDQ&s","email":null,"fcm_token":"d89WglETRyKisp--zGbMUG:APA91bEADq2ACwCgH7KI8XN4VTswQlvkzu4KzimBdVhmCm1LIf_qahjj4IhAxz3UqydOnO5RbLlBwrlx7QNIQS_DAXljAxAdUpV6Sa8k5liKq-6s75LPRJg","public_key":"aNOXFEE7MPXCNGx3rij/GQQ8+FHBOejUjacTGhCbbgE=","created_at":"2025-11-12T06:15:03.259317Z","user_id":3}
/// media_url : "https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251112065251_1000000493.jpg"
/// media_type : "image"
/// created_at : "2025-11-12T06:52:51.937916Z"
/// expires_at : "2025-11-13T06:52:51.937564Z"

class Stories {
  Stories({
      num? id,
    UserInfo? user,
      String? mediaUrl, 
      String? mediaType, 
      dynamic viewCount,
      dynamic distance,
      String? createdAt,
      String? expiresAt,
      bool? viewed,

  }){
    _id = id;
    _user = user;
    _mediaUrl = mediaUrl;
    _mediaType = mediaType;
    _viewCount = viewCount;
    _distance = distance;
    _createdAt = createdAt;
    _expiresAt = expiresAt;
    _viewed = viewed;
}

  Stories.fromJson(dynamic json) {
    _id = json['id'];
    _user = json['user'] != null ? UserInfo.fromJson(json['user']) : null;
    _mediaUrl = json['media_url'];
    _mediaType = json['media_type'];
    _viewCount = json['view_count'];
    _distance = json['distance'];
    _createdAt = json['created_at'];
    _expiresAt = json['expires_at'];
  }
  num? _id;
  UserInfo? _user;
  String? _mediaUrl;
  String? _mediaType;
  dynamic _viewCount;
  dynamic _distance;
  String? _createdAt;
  String? _expiresAt;
  bool? _viewed;
Stories copyWith({  num? id,
  UserInfo? user,
  String? mediaUrl,
  String? mediaType,
  dynamic viewCount,
  dynamic distance,
  String? createdAt,
  String? expiresAt,
}) => Stories(  id: id ?? _id,
  user: user ?? _user,
  mediaUrl: mediaUrl ?? _mediaUrl,
  mediaType: mediaType ?? _mediaType,
  distance: distance ?? _distance,
  createdAt: createdAt ?? _createdAt,
  expiresAt: expiresAt ?? _expiresAt,
);
  num? get id => _id;
  UserInfo? get user => _user;
  String? get mediaUrl => _mediaUrl;
  String? get mediaType => _mediaType;
  dynamic get viewCount => _viewCount;
  dynamic get distance => _distance;
  String? get createdAt => _createdAt;
  String? get expiresAt => _expiresAt;
  bool? get viewed => _viewed;

  setViewed(bool value){
    _viewed=value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['media_url'] = _mediaUrl;
    map['media_type'] = _mediaType;
    map['view_count'] = _viewCount;
    map['distance'] = _distance;
    map['created_at'] = _createdAt;
    map['expires_at'] = _expiresAt;
    return map;
  }

}
