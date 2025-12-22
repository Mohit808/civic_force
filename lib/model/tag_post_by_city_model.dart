import 'post_model.dart' as pm;
class TagPostByCityModel {
  TagPostByCityModel({
      String? message, 
      num? status, 
      Data? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  TagPostByCityModel.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _message;
  num? _status;
  Data? _data;
  TagPostByCityModel copyWith({  String? message,
  num? status,
  Data? data,
}) => TagPostByCityModel(  message: message ?? _message,
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

/// tags : [{"id":15,"post_count":1,"name":"Road","image":null,"color":"#3436bf","priority":0,"created_at":"2025-12-17T07:40:47.614756Z","post":{"id":48,"retweeted_post":null,"user":null,"people_tagged":[],"poll":null,"tag_list":[{"id":15,"name":"Road","color":"#3436bf"}],"text":"","image":"http://res.cloudinary.com/dah5kgjjo/image/upload/v1765014158/o4rstwestciybtqibdtw.jpg","location":"mess, Prayagraj, Uttar Pradesh, India","latitude":25.460968006566297,"longitude":81.8555249646306,"description":null,"can_reply":null,"is_public":true,"likes_count":0,"comments_count":0,"retweet_count":0,"is_deleted":false,"is_reported":false,"is_archived":false,"created_at":"2025-12-06T09:42:38.974128Z","updated_at":"2025-12-06T09:42:38.974153Z","city":4}},{"id":16,"post_count":1,"name":"air quality","image":null,"color":null,"priority":0,"created_at":"2025-12-17T07:40:47.614756Z","post":{"id":52,"retweeted_post":null,"user":null,"people_tagged":[],"poll":null,"tag_list":[{"id":16,"name":"air quality","color":null}],"text":"","image":"http://res.cloudinary.com/dah5kgjjo/image/upload/v1765804104/tmhhrtuisw0ryzuf4wo4.jpg","location":"Fit Road, Sairpur, Uttar Pradesh, India","latitude":25.39508042759541,"longitude":81.71998288482428,"description":null,"can_reply":null,"is_public":true,"likes_count":0,"comments_count":0,"retweet_count":0,"is_deleted":false,"is_reported":false,"is_archived":false,"created_at":"2025-12-15T13:08:25.689803Z","updated_at":"2025-12-15T13:08:25.689876Z","city":4}},{"id":18,"post_count":1,"name":"Illegal parking","image":null,"color":"#38a832","priority":0,"created_at":"2025-12-17T07:40:47.614756Z","post":{"id":49,"retweeted_post":null,"user":null,"people_tagged":[],"poll":null,"tag_list":[{"id":18,"name":"Illegal parking","color":"#38a832"}],"text":"","image":"http://res.cloudinary.com/dah5kgjjo/image/upload/v1765014219/pr8azgu2vgjxx6tx83mv.jpg","location":"2789+47P, Saifabad Bazaar, Uttar Pradesh, India","latitude":26.015418944559155,"longitude":82.26794712245464,"description":null,"can_reply":null,"is_public":true,"likes_count":1,"comments_count":1,"retweet_count":0,"is_deleted":false,"is_reported":false,"is_archived":false,"created_at":"2025-12-06T09:43:39.672934Z","updated_at":"2025-12-06T11:04:19.406467Z","city":4}}]
/// city_details : {"id":4,"name":"Prayagraj Division","image":null,"state":"Uttar Pradesh","country":"India"}

class Data {
  Data({
      List<Tags>? tags, 
      CityDetails? cityDetails,}){
    _tags = tags;
    _cityDetails = cityDetails;
}

  Data.fromJson(dynamic json) {
    if (json['tags'] != null) {
      _tags = [];
      json['tags'].forEach((v) {
        _tags?.add(Tags.fromJson(v));
      });
    }
    _cityDetails = json['city_details'] != null ? CityDetails.fromJson(json['city_details']) : null;
  }
  List<Tags>? _tags;
  CityDetails? _cityDetails;
Data copyWith({  List<Tags>? tags,
  CityDetails? cityDetails,
}) => Data(  tags: tags ?? _tags,
  cityDetails: cityDetails ?? _cityDetails,
);
  List<Tags>? get tags => _tags;
  CityDetails? get cityDetails => _cityDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_tags != null) {
      map['tags'] = _tags?.map((v) => v.toJson()).toList();
    }
    if (_cityDetails != null) {
      map['city_details'] = _cityDetails?.toJson();
    }
    return map;
  }

}

/// id : 4
/// name : "Prayagraj Division"
/// image : null
/// state : "Uttar Pradesh"
/// country : "India"

class CityDetails {
  CityDetails({
      num? id, 
      String? name, 
      dynamic image, 
      String? state, 
      String? country,}){
    _id = id;
    _name = name;
    _image = image;
    _state = state;
    _country = country;
}

  CityDetails.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _state = json['state'];
    _country = json['country'];
  }
  num? _id;
  String? _name;
  dynamic _image;
  String? _state;
  String? _country;
CityDetails copyWith({  num? id,
  String? name,
  dynamic image,
  String? state,
  String? country,
}) => CityDetails(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  state: state ?? _state,
  country: country ?? _country,
);
  num? get id => _id;
  String? get name => _name;
  dynamic get image => _image;
  String? get state => _state;
  String? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['state'] = _state;
    map['country'] = _country;
    return map;
  }

}

/// id : 15
/// post_count : 1
/// name : "Road"
/// image : null
/// color : "#3436bf"
/// priority : 0
/// created_at : "2025-12-17T07:40:47.614756Z"
/// post : {"id":48,"retweeted_post":null,"user":null,"people_tagged":[],"poll":null,"tag_list":[{"id":15,"name":"Road","color":"#3436bf"}],"text":"","image":"http://res.cloudinary.com/dah5kgjjo/image/upload/v1765014158/o4rstwestciybtqibdtw.jpg","location":"mess, Prayagraj, Uttar Pradesh, India","latitude":25.460968006566297,"longitude":81.8555249646306,"description":null,"can_reply":null,"is_public":true,"likes_count":0,"comments_count":0,"retweet_count":0,"is_deleted":false,"is_reported":false,"is_archived":false,"created_at":"2025-12-06T09:42:38.974128Z","updated_at":"2025-12-06T09:42:38.974153Z","city":4}

class Tags {
  Tags({
      num? id, 
      num? postCount, 
      String? name, 
      dynamic image, 
      String? color, 
      num? priority, 
      String? createdAt,
      pm.Data? post,}){
    _id = id;
    _postCount = postCount;
    _name = name;
    _image = image;
    _color = color;
    _priority = priority;
    _createdAt = createdAt;
    _post = post;
}

  Tags.fromJson(dynamic json) {
    _id = json['id'];
    _postCount = json['post_count'];
    _name = json['name'];
    _image = json['image'];
    _color = json['color'];
    _priority = json['priority'];
    _createdAt = json['created_at'];
    _post = json['post'] != null ? pm.Data.fromJson(json['post']) : null;
  }
  num? _id;
  num? _postCount;
  String? _name;
  dynamic _image;
  String? _color;
  num? _priority;
  String? _createdAt;
  pm.Data? _post;
Tags copyWith({  num? id,
  num? postCount,
  String? name,
  dynamic image,
  String? color,
  num? priority,
  String? createdAt,
  pm.Data? post,
}) => Tags(  id: id ?? _id,
  postCount: postCount ?? _postCount,
  name: name ?? _name,
  image: image ?? _image,
  color: color ?? _color,
  priority: priority ?? _priority,
  createdAt: createdAt ?? _createdAt,
  post: post ?? _post,
);
  num? get id => _id;
  num? get postCount => _postCount;
  String? get name => _name;
  dynamic get image => _image;
  String? get color => _color;
  num? get priority => _priority;
  String? get createdAt => _createdAt;
  pm.Data? get post => _post;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['post_count'] = _postCount;
    map['name'] = _name;
    map['image'] = _image;
    map['color'] = _color;
    map['priority'] = _priority;
    map['created_at'] = _createdAt;
    if (_post != null) {
      map['post'] = _post?.toJson();
    }
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