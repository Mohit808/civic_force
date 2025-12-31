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

/// my_stories : [{"id":4,"user":{"id":26,"phone_number":"+919988776655","name":"App Tester","image":"","email":null,"fcm_token":"e9oHqbIHQp2pApwfOl69LQ:APA91bFnLBkzNEVXcrEh_OKVc81lxfBpE0T7pZNEDyWziHJi-WBfxSYxh29J3NXIauCAAilMlcvv66L8JQssSU51jDgnEIPZ1eY4C_i3rNrBCPAJ1yfv1hA","public_key":"/P4pCpS3LJyQtRF38YCR8ScYid/3kk0+StX6vsTVmQA=","created_at":"2025-11-28T06:36:05.038607Z","user_id":22},"viewed":false,"viewCount":1,"media_url":"https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251205070405_1000000562.jpg","media_type":"image","created_at":"2025-12-05T07:04:05.821306Z","expires_at":"2025-12-06T07:04:05.820896Z","latitude":null,"longitude":null},{"id":3,"user":{"id":26,"phone_number":"+919988776655","name":"App Tester","image":"","email":null,"fcm_token":"e9oHqbIHQp2pApwfOl69LQ:APA91bFnLBkzNEVXcrEh_OKVc81lxfBpE0T7pZNEDyWziHJi-WBfxSYxh29J3NXIauCAAilMlcvv66L8JQssSU51jDgnEIPZ1eY4C_i3rNrBCPAJ1yfv1hA","public_key":"/P4pCpS3LJyQtRF38YCR8ScYid/3kk0+StX6vsTVmQA=","created_at":"2025-11-28T06:36:05.038607Z","user_id":22},"viewed":false,"viewCount":1,"media_url":"https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251204134541_1000000560.jpg","media_type":"image","created_at":"2025-12-04T13:45:42.339483Z","expires_at":"2025-12-05T13:45:42.339135Z","latitude":null,"longitude":null},{"id":1,"user":{"id":26,"phone_number":"+919988776655","name":"App Tester","image":"","email":null,"fcm_token":"e9oHqbIHQp2pApwfOl69LQ:APA91bFnLBkzNEVXcrEh_OKVc81lxfBpE0T7pZNEDyWziHJi-WBfxSYxh29J3NXIauCAAilMlcvv66L8JQssSU51jDgnEIPZ1eY4C_i3rNrBCPAJ1yfv1hA","public_key":"/P4pCpS3LJyQtRF38YCR8ScYid/3kk0+StX6vsTVmQA=","created_at":"2025-11-28T06:36:05.038607Z","user_id":22},"viewed":false,"viewCount":2,"media_url":"https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251204130716_1000000563.jpg","media_type":"image","created_at":"2025-12-04T13:07:16.994492Z","expires_at":"2025-12-05T13:07:16.994131Z","latitude":null,"longitude":null}]
/// groupedStories : [{"user_id":2,"name":"Amit Yadav","image":"https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251103074851_1000000040.jpg","items":[{"id":7,"user":{"id":2,"phone_number":"8858459011","name":"Amit Yadav","image":"https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251103074851_1000000040.jpg","email":null,"fcm_token":"eh7nXL5NTY2OekmIjpXPNy:APA91bEF4Reglt3OBBZemSaAo5SnSEr948f76VOjgklffBh3Bs_qKqlY28v7a8Pcbexpe1eNI6EG3U79WM69Z-lyiwB-OuRAEsrCKlRvhYMsH6mZJ9n5JWc","public_key":"ko+AyqDlnXyKZFrSZUn+teO5leAe3N9J0zGkOQFd3DE=","created_at":"2025-11-03T07:43:01.036053Z","user_id":2},"viewed":false,"viewCount":1,"media_url":"https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251205072352_1000000046.jpg","media_type":"image","created_at":"2025-12-05T07:23:52.610271Z","expires_at":"2025-12-06T07:23:52.610026Z","latitude":null,"longitude":null},{"id":6,"user":{"id":2,"phone_number":"8858459011","name":"Amit Yadav","image":"https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251103074851_1000000040.jpg","email":null,"fcm_token":"eh7nXL5NTY2OekmIjpXPNy:APA91bEF4Reglt3OBBZemSaAo5SnSEr948f76VOjgklffBh3Bs_qKqlY28v7a8Pcbexpe1eNI6EG3U79WM69Z-lyiwB-OuRAEsrCKlRvhYMsH6mZJ9n5JWc","public_key":"ko+AyqDlnXyKZFrSZUn+teO5leAe3N9J0zGkOQFd3DE=","created_at":"2025-11-03T07:43:01.036053Z","user_id":2},"viewed":false,"viewCount":1,"media_url":"https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251205072347_1000000044.jpg","media_type":"image","created_at":"2025-12-05T07:23:47.963830Z","expires_at":"2025-12-06T07:23:47.963576Z","latitude":null,"longitude":null},{"id":5,"user":{"id":2,"phone_number":"8858459011","name":"Amit Yadav","image":"https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251103074851_1000000040.jpg","email":null,"fcm_token":"eh7nXL5NTY2OekmIjpXPNy:APA91bEF4Reglt3OBBZemSaAo5SnSEr948f76VOjgklffBh3Bs_qKqlY28v7a8Pcbexpe1eNI6EG3U79WM69Z-lyiwB-OuRAEsrCKlRvhYMsH6mZJ9n5JWc","public_key":"ko+AyqDlnXyKZFrSZUn+teO5leAe3N9J0zGkOQFd3DE=","created_at":"2025-11-03T07:43:01.036053Z","user_id":2},"viewed":false,"viewCount":2,"media_url":"https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251205072328_1000000046.jpg","media_type":"image","created_at":"2025-12-05T07:23:29.207879Z","expires_at":"2025-12-06T07:23:29.207325Z","latitude":null,"longitude":null}]},{"user_id":26,"name":"App Tester","image":"","items":[{"id":4,"user":{"id":26,"phone_number":"+919988776655","name":"App Tester","image":"","email":null,"fcm_token":"e9oHqbIHQp2pApwfOl69LQ:APA91bFnLBkzNEVXcrEh_OKVc81lxfBpE0T7pZNEDyWziHJi-WBfxSYxh29J3NXIauCAAilMlcvv66L8JQssSU51jDgnEIPZ1eY4C_i3rNrBCPAJ1yfv1hA","public_key":"/P4pCpS3LJyQtRF38YCR8ScYid/3kk0+StX6vsTVmQA=","created_at":"2025-11-28T06:36:05.038607Z","user_id":22},"viewed":false,"viewCount":1,"media_url":"https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251205070405_1000000562.jpg","media_type":"image","created_at":"2025-12-05T07:04:05.821306Z","expires_at":"2025-12-06T07:04:05.820896Z","latitude":null,"longitude":null},{"id":3,"user":{"id":26,"phone_number":"+919988776655","name":"App Tester","image":"","email":null,"fcm_token":"e9oHqbIHQp2pApwfOl69LQ:APA91bFnLBkzNEVXcrEh_OKVc81lxfBpE0T7pZNEDyWziHJi-WBfxSYxh29J3NXIauCAAilMlcvv66L8JQssSU51jDgnEIPZ1eY4C_i3rNrBCPAJ1yfv1hA","public_key":"/P4pCpS3LJyQtRF38YCR8ScYid/3kk0+StX6vsTVmQA=","created_at":"2025-11-28T06:36:05.038607Z","user_id":22},"viewed":false,"viewCount":1,"media_url":"https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251204134541_1000000560.jpg","media_type":"image","created_at":"2025-12-04T13:45:42.339483Z","expires_at":"2025-12-05T13:45:42.339135Z","latitude":null,"longitude":null},{"id":1,"user":{"id":26,"phone_number":"+919988776655","name":"App Tester","image":"","email":null,"fcm_token":"e9oHqbIHQp2pApwfOl69LQ:APA91bFnLBkzNEVXcrEh_OKVc81lxfBpE0T7pZNEDyWziHJi-WBfxSYxh29J3NXIauCAAilMlcvv66L8JQssSU51jDgnEIPZ1eY4C_i3rNrBCPAJ1yfv1hA","public_key":"/P4pCpS3LJyQtRF38YCR8ScYid/3kk0+StX6vsTVmQA=","created_at":"2025-11-28T06:36:05.038607Z","user_id":22},"viewed":false,"viewCount":2,"media_url":"https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251204130716_1000000563.jpg","media_type":"image","created_at":"2025-12-04T13:07:16.994492Z","expires_at":"2025-12-05T13:07:16.994131Z","latitude":null,"longitude":null}]},{"user_id":34,"name":"Mobile Tester","image":"","items":[{"id":2,"user":{"id":34,"phone_number":"+919876543210","name":"Mobile Tester","image":"","email":null,"fcm_token":"e9oHqbIHQp2pApwfOl69LQ:APA91bEYZU_GZohRLwQ2MwLVqd8BRJwIkgykHUkjIoVKAd6EC5F7ywXsRelKzL1PK3yS7rDlA1RIaICPV_LOBuqZ7d7HxCjDuBlEO_gK7-GmlE6EAgAVaRk","public_key":null,"created_at":"2025-12-04T13:14:26.015954Z","user_id":30},"viewed":false,"viewCount":2,"media_url":"https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251204131456_1000000562.jpg","media_type":"image","created_at":"2025-12-04T13:14:56.792191Z","expires_at":"2025-12-05T13:14:56.791788Z","latitude":null,"longitude":null}]}]

class Data {
  Data({
    List<Stories>? myStories,
    List<GroupedStories>? groupedStories,}){
    _myStories = myStories;
    _groupedStories = groupedStories;
  }

  Data.fromJson(dynamic json) {
    if (json['my_stories'] != null) {
      _myStories = [];
      json['my_stories'].forEach((v) {
        _myStories?.add(Stories.fromJson(v));
      });
    }
    if (json['groupedStories'] != null) {
      _groupedStories = [];
      json['groupedStories'].forEach((v) {
        _groupedStories?.add(GroupedStories.fromJson(v));
      });
    }
  }
  List<Stories>? _myStories;
  List<GroupedStories>? _groupedStories;
  Data copyWith({  List<Stories>? myStories,
    List<GroupedStories>? groupedStories,
  }) => Data(  myStories: myStories ?? _myStories,
    groupedStories: groupedStories ?? _groupedStories,
  );
  List<Stories>? get myStories => _myStories;
  List<GroupedStories>? get groupedStories => _groupedStories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_myStories != null) {
      map['my_stories'] = _myStories?.map((v) => v.toJson()).toList();
    }
    if (_groupedStories != null) {
      map['groupedStories'] = _groupedStories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class GroupedStories {
  GroupedStories({
    num? userId,
    String? name,
    String? image,
    List<Stories>? items,}){
    _userId = userId;
    _name = name;
    _image = image;
    _items = items;
  }

  GroupedStories.fromJson(dynamic json) {
    _userId = json['user_id'];
    _name = json['name'];
    _image = json['image'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Stories.fromJson(v));
      });
    }
  }
  num? _userId;
  String? _name;
  String? _image;
  List<Stories>? _items;
  GroupedStories copyWith({  num? userId,
    String? name,
    String? image,
    List<Stories>? items,
  }) => GroupedStories(  userId: userId ?? _userId,
    name: name ?? _name,
    image: image ?? _image,
    items: items ?? _items,
  );
  num? get userId => _userId;
  String? get name => _name;
  String? get image => _image;
  List<Stories>? get items => _items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['name'] = _name;
    map['image'] = _image;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 7
/// user : {"id":2,"phone_number":"8858459011","name":"Amit Yadav","image":"https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251103074851_1000000040.jpg","email":null,"fcm_token":"eh7nXL5NTY2OekmIjpXPNy:APA91bEF4Reglt3OBBZemSaAo5SnSEr948f76VOjgklffBh3Bs_qKqlY28v7a8Pcbexpe1eNI6EG3U79WM69Z-lyiwB-OuRAEsrCKlRvhYMsH6mZJ9n5JWc","public_key":"ko+AyqDlnXyKZFrSZUn+teO5leAe3N9J0zGkOQFd3DE=","created_at":"2025-11-03T07:43:01.036053Z","user_id":2}
/// viewed : false
/// viewCount : 1
/// media_url : "https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251205072352_1000000046.jpg"
/// media_type : "image"
/// created_at : "2025-12-05T07:23:52.610271Z"
/// expires_at : "2025-12-06T07:23:52.610026Z"
/// latitude : null
/// longitude : null

class Stories {
  Stories({
    num? id,
    UserInfo? user,
    bool? viewed,
    num? viewCount,
    String? mediaUrl,
    String? mediaType,
    String? text,
    String? createdAt,
    String? expiresAt,
    dynamic latitude,
    dynamic longitude,}){
    _id = id;
    _user = user;
    _viewed = viewed;
    _viewCount = viewCount;
    _mediaUrl = mediaUrl;
    _mediaType = mediaType;
    _text = text;
    _createdAt = createdAt;
    _expiresAt = expiresAt;
    _latitude = latitude;
    _longitude = longitude;
  }

  Stories.fromJson(dynamic json) {
    _id = json['id'];
    _user = json['user'] != null ? UserInfo.fromJson(json['user']) : null;
    _viewed = json['viewed'];
    _viewCount = json['viewCount'];
    _mediaUrl = json['media_url'];
    _mediaType = json['media_type'];
    _text = json['text'];
    _createdAt = json['created_at'];
    _expiresAt = json['expires_at'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }
  num? _id;
  UserInfo? _user;
  bool? _viewed;
  num? _viewCount;
  String? _mediaUrl;
  String? _mediaType;
  String? _text;
  String? _createdAt;
  String? _expiresAt;
  dynamic _latitude;
  dynamic _longitude;
  Stories copyWith({  num? id,
    UserInfo? user,
    bool? viewed,
    num? viewCount,
    String? mediaUrl,
    String? mediaType,
    String? text,
    String? createdAt,
    String? expiresAt,
    dynamic latitude,
    dynamic longitude,
  }) => Stories(  id: id ?? _id,
    user: user ?? _user,
    viewed: viewed ?? _viewed,
    viewCount: viewCount ?? _viewCount,
    mediaUrl: mediaUrl ?? _mediaUrl,
    mediaType: mediaType ?? _mediaType,
    text: text ?? _text,
    createdAt: createdAt ?? _createdAt,
    expiresAt: expiresAt ?? _expiresAt,
    latitude: latitude ?? _latitude,
    longitude: longitude ?? _longitude,
  );
  num? get id => _id;
  UserInfo? get user => _user;
  bool? get viewed => _viewed;
  num? get viewCount => _viewCount;
  String? get mediaUrl => _mediaUrl;
  String? get mediaType => _mediaType;
  String? get text => _text;
  String? get createdAt => _createdAt;
  String? get expiresAt => _expiresAt;
  dynamic get latitude => _latitude;
  dynamic get longitude => _longitude;


  setViewed(value){
    _viewed=value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['viewed'] = _viewed;
    map['viewCount'] = _viewCount;
    map['media_url'] = _mediaUrl;
    map['media_type'] = _mediaType;
    map['text'] = _text;
    map['created_at'] = _createdAt;
    map['expires_at'] = _expiresAt;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    return map;
  }

}