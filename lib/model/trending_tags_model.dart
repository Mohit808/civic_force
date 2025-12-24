
class TrendingTagsModel {
  TrendingTagsModel({
      String? message, 
      num? status, 
      Data? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  TrendingTagsModel.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _message;
  num? _status;
  Data? _data;
TrendingTagsModel copyWith({  String? message,
  num? status,
  Data? data,
}) => TrendingTagsModel(  message: message ?? _message,
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

/// trending_in_your_city : {"id":24,"post_count":2,"name":"public toilet","image":null,"color":"#cc32b4","priority":0,"created_at":"2025-12-23T14:15:29.568431Z"}
/// trending_in_your_country : {"id":21,"post_count":4,"name":"Begger","image":"https://i.pinimg.com/736x/10/28/9a/10289a8bd722d0581fbe5b22ea546316.jpg","color":"#8767f2","priority":0,"created_at":"2025-12-19T18:14:05.759892Z"}
/// trending_around_the_world : {"id":21,"post_count":2,"name":"Begger","image":"https://i.pinimg.com/736x/10/28/9a/10289a8bd722d0581fbe5b22ea546316.jpg","color":"#8767f2","priority":0,"created_at":"2025-12-19T18:14:05.759892Z"}
/// top_trending : {"id":15,"post_count":13,"name":"Road","image":"https://i.pinimg.com/1200x/5a/5b/ed/5a5bedb4d9d0b2d9a196a87be748a3a6.jpg","color":"#3436bf","priority":0,"created_at":"2025-12-17T07:40:47.614756Z"}

class Data {
  Data({
      TrendingInYourCity? trendingInYourCity, 
      TrendingInYourCountry? trendingInYourCountry, 
      TrendingAroundTheWorld? trendingAroundTheWorld, 
      TopTrending? topTrending,}){
    _trendingInYourCity = trendingInYourCity;
    _trendingInYourCountry = trendingInYourCountry;
    _trendingAroundTheWorld = trendingAroundTheWorld;
    _topTrending = topTrending;
}

  Data.fromJson(dynamic json) {
    _trendingInYourCity = json['trending_in_your_city'] != null ? TrendingInYourCity.fromJson(json['trending_in_your_city']) : null;
    _trendingInYourCountry = json['trending_in_your_country'] != null ? TrendingInYourCountry.fromJson(json['trending_in_your_country']) : null;
    _trendingAroundTheWorld = json['trending_around_the_world'] != null ? TrendingAroundTheWorld.fromJson(json['trending_around_the_world']) : null;
    _topTrending = json['top_trending'] != null ? TopTrending.fromJson(json['top_trending']) : null;
  }
  TrendingInYourCity? _trendingInYourCity;
  TrendingInYourCountry? _trendingInYourCountry;
  TrendingAroundTheWorld? _trendingAroundTheWorld;
  TopTrending? _topTrending;
Data copyWith({  TrendingInYourCity? trendingInYourCity,
  TrendingInYourCountry? trendingInYourCountry,
  TrendingAroundTheWorld? trendingAroundTheWorld,
  TopTrending? topTrending,
}) => Data(  trendingInYourCity: trendingInYourCity ?? _trendingInYourCity,
  trendingInYourCountry: trendingInYourCountry ?? _trendingInYourCountry,
  trendingAroundTheWorld: trendingAroundTheWorld ?? _trendingAroundTheWorld,
  topTrending: topTrending ?? _topTrending,
);
  TrendingInYourCity? get trendingInYourCity => _trendingInYourCity;
  TrendingInYourCountry? get trendingInYourCountry => _trendingInYourCountry;
  TrendingAroundTheWorld? get trendingAroundTheWorld => _trendingAroundTheWorld;
  TopTrending? get topTrending => _topTrending;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_trendingInYourCity != null) {
      map['trending_in_your_city'] = _trendingInYourCity?.toJson();
    }
    if (_trendingInYourCountry != null) {
      map['trending_in_your_country'] = _trendingInYourCountry?.toJson();
    }
    if (_trendingAroundTheWorld != null) {
      map['trending_around_the_world'] = _trendingAroundTheWorld?.toJson();
    }
    if (_topTrending != null) {
      map['top_trending'] = _topTrending?.toJson();
    }
    return map;
  }

}


class TopTrending {
  TopTrending({
      num? id, 
      num? postCount, 
      String? name, 
      String? image, 
      String? color, 
      num? priority, 
      String? createdAt,}){
    _id = id;
    _postCount = postCount;
    _name = name;
    _image = image;
    _color = color;
    _priority = priority;
    _createdAt = createdAt;
}

  TopTrending.fromJson(dynamic json) {
    _id = json['id'];
    _postCount = json['post_count'];
    _name = json['name'];
    _image = json['image'];
    _color = json['color'];
    _priority = json['priority'];
    _createdAt = json['created_at'];
  }
  num? _id;
  num? _postCount;
  String? _name;
  String? _image;
  String? _color;
  num? _priority;
  String? _createdAt;
TopTrending copyWith({  num? id,
  num? postCount,
  String? name,
  String? image,
  String? color,
  num? priority,
  String? createdAt,
}) => TopTrending(  id: id ?? _id,
  postCount: postCount ?? _postCount,
  name: name ?? _name,
  image: image ?? _image,
  color: color ?? _color,
  priority: priority ?? _priority,
  createdAt: createdAt ?? _createdAt,
);
  num? get id => _id;
  num? get postCount => _postCount;
  String? get name => _name;
  String? get image => _image;
  String? get color => _color;
  num? get priority => _priority;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['post_count'] = _postCount;
    map['name'] = _name;
    map['image'] = _image;
    map['color'] = _color;
    map['priority'] = _priority;
    map['created_at'] = _createdAt;
    return map;
  }

}

class TrendingAroundTheWorld {
  TrendingAroundTheWorld({
      num? id, 
      num? postCount, 
      String? name, 
      String? image, 
      String? color, 
      num? priority, 
      String? createdAt,}){
    _id = id;
    _postCount = postCount;
    _name = name;
    _image = image;
    _color = color;
    _priority = priority;
    _createdAt = createdAt;
}

  TrendingAroundTheWorld.fromJson(dynamic json) {
    _id = json['id'];
    _postCount = json['post_count'];
    _name = json['name'];
    _image = json['image'];
    _color = json['color'];
    _priority = json['priority'];
    _createdAt = json['created_at'];
  }
  num? _id;
  num? _postCount;
  String? _name;
  String? _image;
  String? _color;
  num? _priority;
  String? _createdAt;
TrendingAroundTheWorld copyWith({  num? id,
  num? postCount,
  String? name,
  String? image,
  String? color,
  num? priority,
  String? createdAt,
}) => TrendingAroundTheWorld(  id: id ?? _id,
  postCount: postCount ?? _postCount,
  name: name ?? _name,
  image: image ?? _image,
  color: color ?? _color,
  priority: priority ?? _priority,
  createdAt: createdAt ?? _createdAt,
);
  num? get id => _id;
  num? get postCount => _postCount;
  String? get name => _name;
  String? get image => _image;
  String? get color => _color;
  num? get priority => _priority;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['post_count'] = _postCount;
    map['name'] = _name;
    map['image'] = _image;
    map['color'] = _color;
    map['priority'] = _priority;
    map['created_at'] = _createdAt;
    return map;
  }

}


class TrendingInYourCountry {
  TrendingInYourCountry({
      num? id, 
      num? postCount, 
      String? name, 
      String? image, 
      String? color, 
      num? priority, 
      String? createdAt,}){
    _id = id;
    _postCount = postCount;
    _name = name;
    _image = image;
    _color = color;
    _priority = priority;
    _createdAt = createdAt;
}

  TrendingInYourCountry.fromJson(dynamic json) {
    _id = json['id'];
    _postCount = json['post_count'];
    _name = json['name'];
    _image = json['image'];
    _color = json['color'];
    _priority = json['priority'];
    _createdAt = json['created_at'];
  }
  num? _id;
  num? _postCount;
  String? _name;
  String? _image;
  String? _color;
  num? _priority;
  String? _createdAt;
TrendingInYourCountry copyWith({  num? id,
  num? postCount,
  String? name,
  String? image,
  String? color,
  num? priority,
  String? createdAt,
}) => TrendingInYourCountry(  id: id ?? _id,
  postCount: postCount ?? _postCount,
  name: name ?? _name,
  image: image ?? _image,
  color: color ?? _color,
  priority: priority ?? _priority,
  createdAt: createdAt ?? _createdAt,
);
  num? get id => _id;
  num? get postCount => _postCount;
  String? get name => _name;
  String? get image => _image;
  String? get color => _color;
  num? get priority => _priority;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['post_count'] = _postCount;
    map['name'] = _name;
    map['image'] = _image;
    map['color'] = _color;
    map['priority'] = _priority;
    map['created_at'] = _createdAt;
    return map;
  }

}

class TrendingInYourCity {
  TrendingInYourCity({
      num? id, 
      num? postCount, 
      String? name, 
      dynamic image, 
      String? color, 
      num? priority, 
      String? createdAt,}){
    _id = id;
    _postCount = postCount;
    _name = name;
    _image = image;
    _color = color;
    _priority = priority;
    _createdAt = createdAt;
}

  TrendingInYourCity.fromJson(dynamic json) {
    _id = json['id'];
    _postCount = json['post_count'];
    _name = json['name'];
    _image = json['image'];
    _color = json['color'];
    _priority = json['priority'];
    _createdAt = json['created_at'];
  }
  num? _id;
  num? _postCount;
  String? _name;
  dynamic _image;
  String? _color;
  num? _priority;
  String? _createdAt;
TrendingInYourCity copyWith({  num? id,
  num? postCount,
  String? name,
  dynamic image,
  String? color,
  num? priority,
  String? createdAt,
}) => TrendingInYourCity(  id: id ?? _id,
  postCount: postCount ?? _postCount,
  name: name ?? _name,
  image: image ?? _image,
  color: color ?? _color,
  priority: priority ?? _priority,
  createdAt: createdAt ?? _createdAt,
);
  num? get id => _id;
  num? get postCount => _postCount;
  String? get name => _name;
  dynamic get image => _image;
  String? get color => _color;
  num? get priority => _priority;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['post_count'] = _postCount;
    map['name'] = _name;
    map['image'] = _image;
    map['color'] = _color;
    map['priority'] = _priority;
    map['created_at'] = _createdAt;
    return map;
  }

}