
class AnalysisModel {
  AnalysisModel({
      String? message, 
      num? status, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  AnalysisModel.fromJson(dynamic json) {
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
AnalysisModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => AnalysisModel(  message: message ?? _message,
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

/// id : 15
/// post_count : 13
/// name : "Road"
/// image : null
/// color : "#3436bf"
/// priority : 0
/// created_at : "2025-12-17T07:40:47.614756Z"

class Data {
  Data({
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

  Data.fromJson(dynamic json) {
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
Data copyWith({  num? id,
  num? postCount,
  String? name,
  dynamic image,
  String? color,
  num? priority,
  String? createdAt,
}) => Data(  id: id ?? _id,
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