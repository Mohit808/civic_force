import 'post_model.dart' as pm;
class OtherUserInfoModel {
  OtherUserInfoModel({
      String? message, 
      num? status, 
      Data? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  OtherUserInfoModel.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _message;
  num? _status;
  Data? _data;
OtherUserInfoModel copyWith({  String? message,
  num? status,
  Data? data,
}) => OtherUserInfoModel(  message: message ?? _message,
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

/// id : 4
/// name : "Base user"
/// email : "a@b.com"
/// image : null
/// user_id : 13
/// follower_count : 0
/// following_count : 1
/// post_count : 2
/// is_following : false
/// posts : [{"id":69,"retweeted_post":{"id":64,"retweeted_post":null,"user":{"id":4,"name":"Base user","email":"a@b.com","image":null,"user_id":13},"people_tagged":[{"id":1,"name":"Amit Yadav","email":null,"image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoFRQjM-wM_nXMA03AGDXgJK3VeX7vtD3ctA&s","user_id":3}],"poll":null,"tag_list":[{"id":15,"name":"Road","color":"#3436bf"}],"text":"","image":"https://i.pinimg.com/1200x/c0/98/4b/c0984bd4779ff9634f9d707ec6ad0f5b.jpg","location":"H9QM+FP6, Noida, Uttar Pradesh, India","latitude":28.588364583891593,"longitude":77.38430131226778,"description":"","can_reply":null,"is_public":true,"likes_count":1,"comments_count":0,"retweet_count":0,"is_deleted":false,"is_reported":false,"is_archived":false,"created_at":"2025-12-16T10:43:09.215745Z","updated_at":"2025-12-19T06:56:18.057215Z","city":13},"user":{"id":4,"name":"Base user","email":"a@b.com","image":null,"user_id":13},"people_tagged":[],"poll":null,"tag_list":[],"text":"","image":"","location":null,"latitude":null,"longitude":null,"description":"","can_reply":null,"is_public":true,"likes_count":0,"comments_count":0,"retweet_count":0,"is_deleted":false,"is_reported":false,"is_archived":false,"created_at":"2025-12-18T11:30:30.303047Z","updated_at":"2025-12-19T06:03:31.847628Z","city":null},{"id":64,"retweeted_post":null,"user":{"id":4,"name":"Base user","email":"a@b.com","image":null,"user_id":13},"people_tagged":[{"id":1,"name":"Amit Yadav","email":null,"image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoFRQjM-wM_nXMA03AGDXgJK3VeX7vtD3ctA&s","user_id":3}],"poll":null,"tag_list":[{"id":15,"name":"Road","color":"#3436bf"}],"text":"","image":"https://i.pinimg.com/1200x/c0/98/4b/c0984bd4779ff9634f9d707ec6ad0f5b.jpg","location":"H9QM+FP6, Noida, Uttar Pradesh, India","latitude":28.588364583891593,"longitude":77.38430131226778,"description":"","can_reply":null,"is_public":true,"likes_count":1,"comments_count":0,"retweet_count":0,"is_deleted":false,"is_reported":false,"is_archived":false,"created_at":"2025-12-16T10:43:09.215745Z","updated_at":"2025-12-19T06:56:18.057215Z","city":13}]

class Data {
  Data({
      num? id, 
      String? name, 
      String? email, 
      dynamic image,
      num? userId, 
      num? followerCount, 
      num? followingCount, 
      num? postCount, 
      bool? isFollowing, 
      List<pm.Data>? posts,}){
    _id = id;
    _name = name;
    _email = email;
    _image = image;
    _userId = userId;
    _followerCount = followerCount;
    _followingCount = followingCount;
    _postCount = postCount;
    _isFollowing = isFollowing;
    _posts = posts;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _image = json['image'];
    _userId = json['user_id'];
    _followerCount = json['follower_count'];
    _followingCount = json['following_count'];
    _postCount = json['post_count'];
    _isFollowing = json['is_following'];
    if (json['posts'] != null) {
      _posts = [];
      json['posts'].forEach((v) {
        _posts?.add(pm.Data.fromJson(v));
      });
    }
  }
  num? _id;
  String? _name;
  String? _email;
  dynamic _image;
  num? _userId;
  num? _followerCount;
  num? _followingCount;
  num? _postCount;
  bool? _isFollowing;
  List<pm.Data>? _posts;
Data copyWith({  num? id,
  String? name,
  String? email,
  dynamic image,
  num? userId,
  num? followerCount,
  num? followingCount,
  num? postCount,
  bool? isFollowing,
  List<pm.Data>? posts,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  image: image ?? _image,
  userId: userId ?? _userId,
  followerCount: followerCount ?? _followerCount,
  followingCount: followingCount ?? _followingCount,
  postCount: postCount ?? _postCount,
  isFollowing: isFollowing ?? _isFollowing,
  posts: posts ?? _posts,
);
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  dynamic get image => _image;
  num? get userId => _userId;
  num? get followerCount => _followerCount;
  num? get followingCount => _followingCount;
  num? get postCount => _postCount;
  bool? get isFollowing => _isFollowing;
  List<pm.Data>? get posts => _posts;

  set isFollowing(value){
    _isFollowing=value;
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['image'] = _image;
    map['user_id'] = _userId;
    map['follower_count'] = _followerCount;
    map['following_count'] = _followingCount;
    map['post_count'] = _postCount;
    map['is_following'] = _isFollowing;
    if (_posts != null) {
      map['posts'] = _posts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

