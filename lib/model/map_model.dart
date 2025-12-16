
class MapModel {
  MapModel({
      String? message, 
      num? status, 
      Data? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  MapModel.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _message;
  num? _status;
  Data? _data;
MapModel copyWith({  String? message,
  num? status,
  Data? data,
}) => MapModel(  message: message ?? _message,
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

/// zoom : 10
/// radius : 100000
/// page : 1
/// page_size : 10
/// total_clusters : 12
/// total_pages : 2
/// clusters : [{"latitude":25.738193475562724,"longitude":82.06173604354262,"count":2,"is_cluster":true,"radius":100000,"markers":[{"id":48,"retweeted_post":null,"people_tagged":[],"tag_list":[{"id":15,"name":"road"}],"text":"","image":"http://res.cloudinary.com/dah5kgjjo/image/upload/v1765014158/o4rstwestciybtqibdtw.jpg","location":"mess, Prayagraj, Uttar Pradesh, India","latitude":25.460968006566297,"longitude":81.8555249646306,"description":null,"can_reply":null,"is_public":true,"likes_count":0,"comments_count":0,"retweet_count":0,"is_deleted":false,"is_reported":false,"is_archived":false,"created_at":"2025-12-06T09:42:38.974128Z","updated_at":"2025-12-06T09:42:38.974153Z","user":null,"city":4},{"id":49,"retweeted_post":null,"people_tagged":[],"tag_list":[{"id":18,"name":"illegal parking"}],"text":"","image":"http://res.cloudinary.com/dah5kgjjo/image/upload/v1765014219/pr8azgu2vgjxx6tx83mv.jpg","location":"2789+47P, Saifabad Bazaar, Uttar Pradesh, India","latitude":26.015418944559155,"longitude":82.26794712245464,"description":null,"can_reply":null,"is_public":true,"likes_count":1,"comments_count":1,"retweet_count":0,"is_deleted":false,"is_reported":false,"is_archived":false,"created_at":"2025-12-06T09:43:39.672934Z","updated_at":"2025-12-06T11:04:19.406467Z","user":null,"city":4}]},{"latitude":28.584333,"longitude":77.387282,"count":1,"is_cluster":false,"radius":100000,"markers":[{"id":37,"retweeted_post":null,"people_tagged":[3],"tag_list":[],"text":"sgegge","image":"","location":null,"latitude":28.584333,"longitude":77.387282,"description":"","can_reply":null,"is_public":true,"likes_count":0,"comments_count":7,"retweet_count":0,"is_deleted":false,"is_reported":false,"is_archived":false,"created_at":"2025-11-25T08:03:15.812313Z","updated_at":"2025-12-04T08:11:08.968599Z","user":4,"city":null}]},{"latitude":23.008658443949653,"longitude":78.6106713116169,"count":1,"is_cluster":false,"radius":100000,"markers":[{"id":40,"retweeted_post":null,"people_tagged":[],"tag_list":[{"id":14,"name":"street dog"}],"text":"","image":"http://res.cloudinary.com/dah5kgjjo/image/upload/v1764749026/yfo8xguwsyxxb8qwz2td.png","location":"Kelkachh, Kelkachh, Madhya Pradesh, India","latitude":23.008658443949653,"longitude":78.6106713116169,"description":"","can_reply":null,"is_public":true,"likes_count":1,"comments_count":3,"retweet_count":0,"is_deleted":false,"is_reported":false,"is_archived":false,"created_at":"2025-12-03T08:03:47.745455Z","updated_at":"2025-12-04T11:42:49.978766Z","user":4,"city":null}]},{"latitude":23.895539381467263,"longitude":79.31379664689302,"count":1,"is_cluster":false,"radius":100000,"markers":[{"id":41,"retweeted_post":null,"people_tagged":[],"tag_list":[{"id":16,"name":"air quality"}],"text":"","image":"http://res.cloudinary.com/dah5kgjjo/image/upload/v1765011910/gllnge1oviywbdjpgap3.jpg","location":"Bakeni, Bakeni, Madhya Pradesh, India","latitude":23.895539381467263,"longitude":79.31379664689302,"description":null,"can_reply":null,"is_public":true,"likes_count":0,"comments_count":0,"retweet_count":0,"is_deleted":false,"is_reported":false,"is_archived":false,"created_at":"2025-12-06T09:05:12.528202Z","updated_at":"2025-12-06T09:05:12.528253Z","user":null,"city":null}]},{"latitude":23.520000291097187,"longitude":77.20441896468401,"count":1,"is_cluster":false,"radius":100000,"markers":[{"id":42,"retweeted_post":null,"people_tagged":[],"tag_list":[{"id":16,"name":"air quality"},{"id":17,"name":"chcgchch"}],"text":"","image":"http://res.cloudinary.com/dah5kgjjo/image/upload/v1765012384/oczlg7jo7nyaohdowrvu.jpg","location":"National Highway 346, Ahmadpur, Madhya Pradesh, India","latitude":23.520000291097187,"longitude":77.20441896468401,"description":null,"can_reply":null,"is_public":true,"likes_count":0,"comments_count":0,"retweet_count":0,"is_deleted":false,"is_reported":false,"is_archived":false,"created_at":"2025-12-06T09:13:04.782705Z","updated_at":"2025-12-06T09:13:04.782778Z","user":null,"city":null}]},{"latitude":26.964178211029022,"longitude":78.20051494985819,"count":1,"is_cluster":false,"radius":100000,"markers":[{"id":43,"retweeted_post":null,"people_tagged":[],"tag_list":[{"id":18,"name":"illegal parking"}],"text":"","image":"http://res.cloudinary.com/dah5kgjjo/image/upload/v1765013089/cq389wrpylcycbf5jm2d.jpg","location":"X682+9HG, Shamsabad, Uttar Pradesh, India","latitude":26.964178211029022,"longitude":78.20051494985819,"description":null,"can_reply":null,"is_public":true,"likes_count":0,"comments_count":0,"retweet_count":0,"is_deleted":false,"is_reported":false,"is_archived":false,"created_at":"2025-12-06T09:24:50.296328Z","updated_at":"2025-12-06T09:24:50.296371Z","user":null,"city":1}]},{"latitude":23.197250487052546,"longitude":77.38020088523626,"count":1,"is_cluster":false,"radius":100000,"markers":[{"id":44,"retweeted_post":null,"people_tagged":[],"tag_list":[{"id":11,"name":"plastic pollution"}],"text":"","image":"http://res.cloudinary.com/dah5kgjjo/image/upload/v1765013376/r5arcs20fld3nmvzmnkb.jpg","location":"Kaliasot Road, Bhopal, Madhya Pradesh, India","latitude":23.197250487052546,"longitude":77.38020088523626,"description":null,"can_reply":null,"is_public":true,"likes_count":0,"comments_count":0,"retweet_count":0,"is_deleted":false,"is_reported":false,"is_archived":false,"created_at":"2025-12-06T09:29:36.946500Z","updated_at":"2025-12-06T09:29:36.946532Z","user":null,"city":2}]},{"latitude":20.258409211943775,"longitude":82.30207789689302,"count":1,"is_cluster":false,"radius":100000,"markers":[{"id":47,"retweeted_post":null,"people_tagged":[],"tag_list":[{"id":16,"name":"air quality"}],"text":"","image":"http://res.cloudinary.com/dah5kgjjo/image/upload/v1765014086/hdvnoz9tzdn07hoaowoz.jpg","location":"Khasra No. 83, Kawarama, Chhattisgarh, India","latitude":20.258409211943775,"longitude":82.30207789689302,"description":null,"can_reply":null,"is_public":true,"likes_count":0,"comments_count":0,"retweet_count":0,"is_deleted":false,"is_reported":false,"is_archived":false,"created_at":"2025-12-06T09:41:27.082280Z","updated_at":"2025-12-06T09:41:27.082340Z","user":null,"city":3}]},{"latitude":25.39508042759541,"longitude":81.71998288482428,"count":1,"is_cluster":false,"radius":100000,"markers":[{"id":52,"retweeted_post":null,"people_tagged":[],"tag_list":[{"id":16,"name":"air quality"}],"text":"","image":"http://res.cloudinary.com/dah5kgjjo/image/upload/v1765804104/tmhhrtuisw0ryzuf4wo4.jpg","location":"Fit Road, Sairpur, Uttar Pradesh, India","latitude":25.39508042759541,"longitude":81.71998288482428,"description":null,"can_reply":null,"is_public":true,"likes_count":0,"comments_count":0,"retweet_count":0,"is_deleted":false,"is_reported":false,"is_archived":false,"created_at":"2025-12-15T13:08:25.689803Z","updated_at":"2025-12-15T13:08:25.689876Z","user":null,"city":4}]},{"latitude":26.192353181181126,"longitude":81.85851965099573,"count":1,"is_cluster":false,"radius":100000,"markers":[{"id":53,"retweeted_post":null,"people_tagged":[],"tag_list":[{"id":15,"name":"road"}],"text":"","image":"http://res.cloudinary.com/dah5kgjjo/image/upload/v1765804136/pcrveuiedj9jqzcn7ykt.jpg","location":"Bandoiya, Bandoiya, Uttar Pradesh, India","latitude":26.192353181181126,"longitude":81.85851965099573,"description":null,"can_reply":null,"is_public":true,"likes_count":0,"comments_count":0,"retweet_count":0,"is_deleted":false,"is_reported":false,"is_archived":false,"created_at":"2025-12-15T13:08:57.217713Z","updated_at":"2025-12-15T13:08:57.217758Z","user":null,"city":5}]}]

class Data {
  Data({
      num? zoom, 
      num? radius, 
      num? page, 
      num? pageSize, 
      num? totalClusters, 
      num? totalPages, 
      List<Clusters>? clusters,}){
    _zoom = zoom;
    _radius = radius;
    _page = page;
    _pageSize = pageSize;
    _totalClusters = totalClusters;
    _totalPages = totalPages;
    _clusters = clusters;
}

  Data.fromJson(dynamic json) {
    _zoom = json['zoom'];
    _radius = json['radius'];
    _page = json['page'];
    _pageSize = json['page_size'];
    _totalClusters = json['total_clusters'];
    _totalPages = json['total_pages'];
    if (json['clusters'] != null) {
      _clusters = [];
      json['clusters'].forEach((v) {
        _clusters?.add(Clusters.fromJson(v));
      });
    }
  }
  num? _zoom;
  num? _radius;
  num? _page;
  num? _pageSize;
  num? _totalClusters;
  num? _totalPages;
  List<Clusters>? _clusters;
Data copyWith({  num? zoom,
  num? radius,
  num? page,
  num? pageSize,
  num? totalClusters,
  num? totalPages,
  List<Clusters>? clusters,
}) => Data(  zoom: zoom ?? _zoom,
  radius: radius ?? _radius,
  page: page ?? _page,
  pageSize: pageSize ?? _pageSize,
  totalClusters: totalClusters ?? _totalClusters,
  totalPages: totalPages ?? _totalPages,
  clusters: clusters ?? _clusters,
);
  num? get zoom => _zoom;
  num? get radius => _radius;
  num? get page => _page;
  num? get pageSize => _pageSize;
  num? get totalClusters => _totalClusters;
  num? get totalPages => _totalPages;
  List<Clusters>? get clusters => _clusters;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['zoom'] = _zoom;
    map['radius'] = _radius;
    map['page'] = _page;
    map['page_size'] = _pageSize;
    map['total_clusters'] = _totalClusters;
    map['total_pages'] = _totalPages;
    if (_clusters != null) {
      map['clusters'] = _clusters?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// latitude : 25.738193475562724
/// longitude : 82.06173604354262
/// count : 2
/// is_cluster : true
/// radius : 100000
/// markers : [{"id":48,"retweeted_post":null,"people_tagged":[],"tag_list":[{"id":15,"name":"road"}],"text":"","image":"http://res.cloudinary.com/dah5kgjjo/image/upload/v1765014158/o4rstwestciybtqibdtw.jpg","location":"mess, Prayagraj, Uttar Pradesh, India","latitude":25.460968006566297,"longitude":81.8555249646306,"description":null,"can_reply":null,"is_public":true,"likes_count":0,"comments_count":0,"retweet_count":0,"is_deleted":false,"is_reported":false,"is_archived":false,"created_at":"2025-12-06T09:42:38.974128Z","updated_at":"2025-12-06T09:42:38.974153Z","user":null,"city":4},{"id":49,"retweeted_post":null,"people_tagged":[],"tag_list":[{"id":18,"name":"illegal parking"}],"text":"","image":"http://res.cloudinary.com/dah5kgjjo/image/upload/v1765014219/pr8azgu2vgjxx6tx83mv.jpg","location":"2789+47P, Saifabad Bazaar, Uttar Pradesh, India","latitude":26.015418944559155,"longitude":82.26794712245464,"description":null,"can_reply":null,"is_public":true,"likes_count":1,"comments_count":1,"retweet_count":0,"is_deleted":false,"is_reported":false,"is_archived":false,"created_at":"2025-12-06T09:43:39.672934Z","updated_at":"2025-12-06T11:04:19.406467Z","user":null,"city":4}]

class Clusters {
  Clusters({
      num? latitude, 
      num? longitude, 
      num? count, 
      bool? isCluster, 
      num? radius, 
      List<Markers>? markers,}){
    _latitude = latitude;
    _longitude = longitude;
    _count = count;
    _isCluster = isCluster;
    _radius = radius;
    _markers = markers;
}

  Clusters.fromJson(dynamic json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _count = json['count'];
    _isCluster = json['is_cluster'];
    _radius = json['radius'];
    if (json['markers'] != null) {
      _markers = [];
      json['markers'].forEach((v) {
        _markers?.add(Markers.fromJson(v));
      });
    }
  }
  num? _latitude;
  num? _longitude;
  num? _count;
  bool? _isCluster;
  num? _radius;
  List<Markers>? _markers;
Clusters copyWith({  num? latitude,
  num? longitude,
  num? count,
  bool? isCluster,
  num? radius,
  List<Markers>? markers,
}) => Clusters(  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  count: count ?? _count,
  isCluster: isCluster ?? _isCluster,
  radius: radius ?? _radius,
  markers: markers ?? _markers,
);
  num? get latitude => _latitude;
  num? get longitude => _longitude;
  num? get count => _count;
  bool? get isCluster => _isCluster;
  num? get radius => _radius;
  List<Markers>? get markers => _markers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['count'] = _count;
    map['is_cluster'] = _isCluster;
    map['radius'] = _radius;
    if (_markers != null) {
      map['markers'] = _markers?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 48
/// retweeted_post : null
/// people_tagged : []
/// tag_list : [{"id":15,"name":"road"}]
/// text : ""
/// image : "http://res.cloudinary.com/dah5kgjjo/image/upload/v1765014158/o4rstwestciybtqibdtw.jpg"
/// location : "mess, Prayagraj, Uttar Pradesh, India"
/// latitude : 25.460968006566297
/// longitude : 81.8555249646306
/// description : null
/// can_reply : null
/// is_public : true
/// likes_count : 0
/// comments_count : 0
/// retweet_count : 0
/// is_deleted : false
/// is_reported : false
/// is_archived : false
/// created_at : "2025-12-06T09:42:38.974128Z"
/// updated_at : "2025-12-06T09:42:38.974153Z"
/// user : null
/// city : 4

class Markers {
  Markers({
      num? id, 
      dynamic retweetedPost, 
      List<dynamic>? peopleTagged, 
      List<TagList>? tagList, 
      String? text, 
      String? image, 
      String? location, 
      num? latitude, 
      num? longitude, 
      dynamic description, 
      dynamic canReply, 
      bool? isPublic, 
      num? likesCount, 
      num? commentsCount, 
      num? retweetCount, 
      bool? isDeleted, 
      bool? isReported, 
      bool? isArchived, 
      String? createdAt, 
      String? updatedAt, 
      dynamic user, 
      num? city,}){
    _id = id;
    _retweetedPost = retweetedPost;
    _peopleTagged = peopleTagged;
    _tagList = tagList;
    _text = text;
    _image = image;
    _location = location;
    _latitude = latitude;
    _longitude = longitude;
    _description = description;
    _canReply = canReply;
    _isPublic = isPublic;
    _likesCount = likesCount;
    _commentsCount = commentsCount;
    _retweetCount = retweetCount;
    _isDeleted = isDeleted;
    _isReported = isReported;
    _isArchived = isArchived;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _user = user;
    _city = city;
}

  Markers.fromJson(dynamic json) {
    _id = json['id'];
    _retweetedPost = json['retweeted_post'];
    if (json['people_tagged'] != null) {
      _peopleTagged = [];
      // json['people_tagged'].forEach((v) {
      //   _peopleTagged?.add(Dynamic.fromJson(v));
      // });
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
    _isPublic = json['is_public'];
    _likesCount = json['likes_count'];
    _commentsCount = json['comments_count'];
    _retweetCount = json['retweet_count'];
    _isDeleted = json['is_deleted'];
    _isReported = json['is_reported'];
    _isArchived = json['is_archived'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _user = json['user'];
    _city = json['city'];
  }
  num? _id;
  dynamic _retweetedPost;
  List<dynamic>? _peopleTagged;
  List<TagList>? _tagList;
  String? _text;
  String? _image;
  String? _location;
  num? _latitude;
  num? _longitude;
  dynamic _description;
  dynamic _canReply;
  bool? _isPublic;
  num? _likesCount;
  num? _commentsCount;
  num? _retweetCount;
  bool? _isDeleted;
  bool? _isReported;
  bool? _isArchived;
  String? _createdAt;
  String? _updatedAt;
  dynamic _user;
  num? _city;
Markers copyWith({  num? id,
  dynamic retweetedPost,
  List<dynamic>? peopleTagged,
  List<TagList>? tagList,
  String? text,
  String? image,
  String? location,
  num? latitude,
  num? longitude,
  dynamic description,
  dynamic canReply,
  bool? isPublic,
  num? likesCount,
  num? commentsCount,
  num? retweetCount,
  bool? isDeleted,
  bool? isReported,
  bool? isArchived,
  String? createdAt,
  String? updatedAt,
  dynamic user,
  num? city,
}) => Markers(  id: id ?? _id,
  retweetedPost: retweetedPost ?? _retweetedPost,
  peopleTagged: peopleTagged ?? _peopleTagged,
  tagList: tagList ?? _tagList,
  text: text ?? _text,
  image: image ?? _image,
  location: location ?? _location,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  description: description ?? _description,
  canReply: canReply ?? _canReply,
  isPublic: isPublic ?? _isPublic,
  likesCount: likesCount ?? _likesCount,
  commentsCount: commentsCount ?? _commentsCount,
  retweetCount: retweetCount ?? _retweetCount,
  isDeleted: isDeleted ?? _isDeleted,
  isReported: isReported ?? _isReported,
  isArchived: isArchived ?? _isArchived,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  user: user ?? _user,
  city: city ?? _city,
);
  num? get id => _id;
  dynamic get retweetedPost => _retweetedPost;
  List<dynamic>? get peopleTagged => _peopleTagged;
  List<TagList>? get tagList => _tagList;
  String? get text => _text;
  String? get image => _image;
  String? get location => _location;
  num? get latitude => _latitude;
  num? get longitude => _longitude;
  dynamic get description => _description;
  dynamic get canReply => _canReply;
  bool? get isPublic => _isPublic;
  num? get likesCount => _likesCount;
  num? get commentsCount => _commentsCount;
  num? get retweetCount => _retweetCount;
  bool? get isDeleted => _isDeleted;
  bool? get isReported => _isReported;
  bool? get isArchived => _isArchived;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get user => _user;
  num? get city => _city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['retweeted_post'] = _retweetedPost;
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
    map['is_public'] = _isPublic;
    map['likes_count'] = _likesCount;
    map['comments_count'] = _commentsCount;
    map['retweet_count'] = _retweetCount;
    map['is_deleted'] = _isDeleted;
    map['is_reported'] = _isReported;
    map['is_archived'] = _isArchived;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['user'] = _user;
    map['city'] = _city;
    return map;
  }

}

/// id : 15
/// name : "road"

class TagList {
  TagList({
      num? id, 
      String? name,
      String? color,

  }){
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