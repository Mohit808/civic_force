
import 'package:civic_force/model/user_model.dart';

class PostModel {
  PostModel({
      String? message, 
      num? status, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  PostModel.fromJson(dynamic json) {
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
PostModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => PostModel(  message: message ?? _message,
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

/// id : 64
/// retweeted_post : null
/// user : {"id":1,"name":"Amit Yadav","email":null,"profile_picture":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoFRQjM-wM_nXMA03AGDXgJK3VeX7vtD3ctA&s","user_id":3}
/// people_tagged : [{"id":1,"name":"Amit Yadav","email":null,"profile_picture":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoFRQjM-wM_nXMA03AGDXgJK3VeX7vtD3ctA&s","user_id":3}]
/// tag_list : [{"id":15,"name":"road","color":"#3436bf"}]
/// text : ""
/// image : "http://res.cloudinary.com/dah5kgjjo/image/upload/v1765881788/eb9dbjlwrbttefvjikqz.jpg"
/// location : "H9QM+FP6, Noida, Uttar Pradesh, India"
/// latitude : 28.588364583891593
/// longitude : 77.38430131226778
/// description : ""
/// can_reply : null
/// is_public : true
/// likes_count : 0
/// comments_count : 0
/// retweet_count : 0
/// is_deleted : false
/// is_reported : false
/// is_archived : false
/// created_at : "2025-12-16T10:43:09.215745Z"
/// updated_at : "2025-12-17T06:43:12.379742Z"
/// city : 13
/// is_saved : false

class Data {
  Data({
      num? id, 
      dynamic retweetedPost,
    UserInfo? user,
      List<UserInfo>? peopleTagged,
      List<TagList>? tagList, 
      String? text, 
      String? image, 
      String? location, 
      num? latitude, 
      num? longitude, 
      String? description, 
      dynamic canReply, 
      dynamic isLiked,
      bool? isPublic,
      num? likesCount, 
      num? commentsCount, 
      num? retweetCount, 
      bool? isDeleted, 
      bool? isReported, 
      bool? isArchived, 
      String? createdAt, 
      String? updatedAt, 
      num? city, 
      bool? isSaved,}){
    _id = id;
    _retweetedPost = retweetedPost;
    _user = user;
    _peopleTagged = peopleTagged;
    _tagList = tagList;
    _text = text;
    _image = image;
    _location = location;
    _latitude = latitude;
    _longitude = longitude;
    _description = description;
    _canReply = canReply;
    _isLiked = isLiked;
    _isPublic = isPublic;
    _likesCount = likesCount;
    _commentsCount = commentsCount;
    _retweetCount = retweetCount;
    _isDeleted = isDeleted;
    _isReported = isReported;
    _isArchived = isArchived;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _city = city;
    _isSaved = isSaved;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    // _retweetedPost = json['retweeted_post'];
    _retweetedPost = json['retweeted_post'] != null ? Data.fromJson(json['retweeted_post']) : null;

    _user = json['user'] != null ? UserInfo.fromJson(json['user']) : null;
    if (json['people_tagged'] != null) {
      _peopleTagged = [];
      json['people_tagged'].forEach((v) {
        _peopleTagged?.add(UserInfo.fromJson(v));
      });
    }
    if (json['tag_list'] != null) {
      _tagList = [];
      json['tag_list'].forEach((v) {
        _tagList?.add(TagList.fromJson(v));
      });
    }
    _text = json['text'];
    _image = json['image'];
    _location = json['location'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _description = json['description'];
    _canReply = json['can_reply'];
    _isLiked = json['is_liked'];
    _isPublic = json['is_public'];
    _likesCount = json['likes_count'];
    _commentsCount = json['comments_count'];
    _retweetCount = json['retweet_count'];
    _isDeleted = json['is_deleted'];
    _isReported = json['is_reported'];
    _isArchived = json['is_archived'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _city = json['city'];
    _isSaved = json['is_saved'];
  }
  num? _id;
  dynamic _retweetedPost;
  UserInfo? _user;
  List<UserInfo>? _peopleTagged;
  List<TagList>? _tagList;
  String? _text;
  String? _image;
  String? _location;
  num? _latitude;
  num? _longitude;
  String? _description;
  dynamic _canReply;
  dynamic _isLiked;
  bool? _isPublic;
  num? _likesCount;
  num? _commentsCount;
  num? _retweetCount;
  bool? _isDeleted;
  bool? _isReported;
  bool? _isArchived;
  String? _createdAt;
  String? _updatedAt;
  num? _city;
  bool? _isSaved;
Data copyWith({  num? id,
  dynamic retweetedPost,
  UserInfo? user,
  List<UserInfo>? peopleTagged,
  List<TagList>? tagList,
  String? text,
  String? image,
  String? location,
  num? latitude,
  num? longitude,
  String? description,
  dynamic canReply,
  dynamic isLiked,
  bool? isPublic,
  num? likesCount,
  num? commentsCount,
  num? retweetCount,
  bool? isDeleted,
  bool? isReported,
  bool? isArchived,
  String? createdAt,
  String? updatedAt,
  num? city,
  bool? isSaved,
}) => Data(  id: id ?? _id,
  retweetedPost: retweetedPost ?? _retweetedPost,
  user: user ?? _user,
  peopleTagged: peopleTagged ?? _peopleTagged,
  tagList: tagList ?? _tagList,
  text: text ?? _text,
  image: image ?? _image,
  location: location ?? _location,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  description: description ?? _description,
  canReply: canReply ?? _canReply,
  isLiked: isLiked ?? _isLiked,
  isPublic: isPublic ?? _isPublic,
  likesCount: likesCount ?? _likesCount,
  commentsCount: commentsCount ?? _commentsCount,
  retweetCount: retweetCount ?? _retweetCount,
  isDeleted: isDeleted ?? _isDeleted,
  isReported: isReported ?? _isReported,
  isArchived: isArchived ?? _isArchived,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  city: city ?? _city,
  isSaved: isSaved ?? _isSaved,
);
  num? get id => _id;
  dynamic get retweetedPost => _retweetedPost;
  UserInfo? get user => _user;
  List<UserInfo>? get peopleTagged => _peopleTagged;
  List<TagList>? get tagList => _tagList;
  String? get text => _text;
  String? get image => _image;
  String? get location => _location;
  num? get latitude => _latitude;
  num? get longitude => _longitude;
  String? get description => _description;
  dynamic get canReply => _canReply;
  dynamic get isLiked => _isLiked;
  bool? get isPublic => _isPublic;
  num? get likesCount => _likesCount;
  num? get commentsCount => _commentsCount;
  num? get retweetCount => _retweetCount;
  bool? get isDeleted => _isDeleted;
  bool? get isReported => _isReported;
  bool? get isArchived => _isArchived;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get city => _city;
  bool? get isSaved => _isSaved;



  set setLike(bool value){
    _isLiked=value;
  }
  set setLikeCount(value){
    _likesCount=value;
  }
  set setSaved(value){
    _isSaved=value;
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['retweeted_post'] = _retweetedPost;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_peopleTagged != null) {
      map['people_tagged'] = _peopleTagged?.map((v) => v.toJson()).toList();
    }
    if (_tagList != null) {
      map['tag_list'] = _tagList?.map((v) => v.toJson()).toList();
    }
    map['text'] = _text;
    map['image'] = _image;
    map['location'] = _location;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['description'] = _description;
    map['can_reply'] = _canReply;
    map['is_liked'] = _isLiked;
    map['is_public'] = _isPublic;
    map['likes_count'] = _likesCount;
    map['comments_count'] = _commentsCount;
    map['retweet_count'] = _retweetCount;
    map['is_deleted'] = _isDeleted;
    map['is_reported'] = _isReported;
    map['is_archived'] = _isArchived;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['city'] = _city;
    map['is_saved'] = _isSaved;
    return map;
  }

}

class TagList {
  TagList({
      num? id, 
      String? name, 
      String? color,}){
    _id = id;
    _name = name;
    _color = color;
}

  TagList.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _color = json['color'];
  }
  num? _id;
  String? _name;
  String? _color;
TagList copyWith({  num? id,
  String? name,
  String? color,
}) => TagList(  id: id ?? _id,
  name: name ?? _name,
  color: color ?? _color,
);
  num? get id => _id;
  String? get name => _name;
  String? get color => _color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['color'] = _color;
    return map;
  }

}