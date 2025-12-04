
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

/// id : 12
/// text : "Harry Brook placed an arm of comfort around Ravindra Jadeja, crouched on the grass near the 22-yard strip. Jadeja responded with a nod and half a smile. A brave smile of defiance that hid the hurt simmering inside him. As he slowly made his way back to the pavilion, Ben Stokes gave him a tight warm hug. The Indian emerged from the embrace with the defiant smile on his again."
/// image : "https://images.indianexpress.com/2025/07/Jadeja-20.jpg?w=640"
/// location : "12"
/// latitude : 12.0
/// longitude : 12.0
/// tags : null
/// description : ""
/// can_reply : null
/// is_public : true
/// likes_count : 0
/// comments_count : 0
/// retweet_count : 0
/// is_deleted : false
/// is_reported : false
/// is_archived : false
/// created_at : "2025-07-16T11:10:11.374057Z"
/// updated_at : "2025-07-16T11:10:11.374098Z"
/// user_id : 29
/// people_tagged : []

class Data {
  Data({
      num? id, 
      String? text, 
      String? image, 
      String? location, 
      num? latitude, 
      num? longitude, 
      dynamic tags, 
      String? description, 
      dynamic canReply, 
      bool? isPublic, 
      num? likesCount, 
      bool? isLiked,
      num? commentsCount,
      num? retweetCount, 
      bool? isDeleted, 
      bool? isReported, 
      bool? isArchived, 
      String? createdAt, 
      String? updatedAt, 
      num? userId, 
      bool? isSaved,
      List<dynamic>? peopleTagged,}){
    _id = id;
    _text = text;
    _image = image;
    _location = location;
    _latitude = latitude;
    _longitude = longitude;
    _tags = tags;
    _description = description;
    _canReply = canReply;
    _isPublic = isPublic;
    _likesCount = likesCount;
    _isLiked = isLiked;
    _commentsCount = commentsCount;
    _retweetCount = retweetCount;
    _isDeleted = isDeleted;
    _isReported = isReported;
    _isArchived = isArchived;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _userId = userId;
    _peopleTagged = peopleTagged;
    _isSaved = isSaved;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _text = json['text'];
    _image = json['image'];
    _location = json['location'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _tags = json['tags'];
    _description = json['description'];
    _canReply = json['can_reply'];
    _isPublic = json['is_public'];
    _likesCount = json['likes_count'];
    _isLiked = json['is_liked'];
    _commentsCount = json['comments_count'];
    _retweetCount = json['retweet_count'];
    _isDeleted = json['is_deleted'];
    _isReported = json['is_reported'];
    _isArchived = json['is_archived'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _userId = json['user_id'];
    _isSaved = json['is_saved'];
    if (json['people_tagged'] != null) {
      _peopleTagged = [];
      json['people_tagged'].forEach((v) {
        // _peopleTagged?.add(Dynamic.fromJson(v));
      });
    }
  }
  num? _id;
  String? _text;
  String? _image;
  String? _location;
  num? _latitude;
  num? _longitude;
  dynamic _tags;
  String? _description;
  dynamic _canReply;
  bool? _isPublic;
  num? _likesCount;
  bool? _isLiked;
  num? _commentsCount;
  num? _retweetCount;
  bool? _isDeleted;
  bool? _isReported;
  bool? _isArchived;
  String? _createdAt;
  String? _updatedAt;
  num? _userId;
  bool? _isSaved;
  List<dynamic>? _peopleTagged;
Data copyWith({  num? id,
  String? text,
  String? image,
  String? location,
  num? latitude,
  num? longitude,
  dynamic tags,
  String? description,
  dynamic canReply,
  bool? isPublic,
  num? likesCount,
  bool? isLiked,
  num? commentsCount,
  num? retweetCount,
  bool? isDeleted,
  bool? isReported,
  bool? isArchived,
  String? createdAt,
  String? updatedAt,
  num? userId,
  List<dynamic>? peopleTagged,
}) => Data(  id: id ?? _id,
  text: text ?? _text,
  image: image ?? _image,
  location: location ?? _location,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  tags: tags ?? _tags,
  description: description ?? _description,
  canReply: canReply ?? _canReply,
  isPublic: isPublic ?? _isPublic,
  likesCount: likesCount ?? _likesCount,
  isLiked: isLiked ?? _isLiked,
  commentsCount: commentsCount ?? _commentsCount,
  retweetCount: retweetCount ?? _retweetCount,
  isDeleted: isDeleted ?? _isDeleted,
  isReported: isReported ?? _isReported,
  isArchived: isArchived ?? _isArchived,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  userId: userId ?? _userId,
  peopleTagged: peopleTagged ?? _peopleTagged,
);
  num? get id => _id;
  String? get text => _text;
  String? get image => _image;
  String? get location => _location;
  num? get latitude => _latitude;
  num? get longitude => _longitude;
  dynamic get tags => _tags;
  String? get description => _description;
  dynamic get canReply => _canReply;
  bool? get isPublic => _isPublic;
  num? get likesCount => _likesCount;
  bool? get isLiked => _isLiked;
  num? get commentsCount => _commentsCount;
  num? get retweetCount => _retweetCount;
  bool? get isDeleted => _isDeleted;
  bool? get isReported => _isReported;
  bool? get isArchived => _isArchived;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get userId => _userId;
  bool? get isSaved => _isSaved;
  List<dynamic>? get peopleTagged => _peopleTagged;

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
    map['text'] = _text;
    map['image'] = _image;
    map['location'] = _location;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['tags'] = _tags;
    map['description'] = _description;
    map['can_reply'] = _canReply;
    map['is_public'] = _isPublic;
    map['likes_count'] = _likesCount;
    map['is_liked'] = _isLiked;
    map['comments_count'] = _commentsCount;
    map['retweet_count'] = _retweetCount;
    map['is_deleted'] = _isDeleted;
    map['is_reported'] = _isReported;
    map['is_archived'] = _isArchived;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['user_id'] = _userId;
    if (_peopleTagged != null) {
      map['people_tagged'] = _peopleTagged?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}