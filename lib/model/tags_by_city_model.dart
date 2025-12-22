
import 'package:civic_force/model/tag_post_by_city_model.dart';

class TagsByCityModel {
  TagsByCityModel({
      String? message, 
      num? status, 
      Data? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  TagsByCityModel.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _message;
  num? _status;
  Data? _data;
TagsByCityModel copyWith({  String? message,
  num? status,
  Data? data,
}) => TagsByCityModel(  message: message ?? _message,
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

class Data {
  Data({
      List<Tags>? withImage,
      List<Tags>? withoutImage,}){
    _withImage = withImage;
    _withoutImage = withoutImage;
}

  Data.fromJson(dynamic json) {
    if (json['with_image'] != null) {
      _withImage = [];
      json['with_image'].forEach((v) {
        _withImage?.add(Tags.fromJson(v));
      });
    }
    if (json['without_image'] != null) {
      _withoutImage = [];
      json['without_image'].forEach((v) {
        _withoutImage?.add(Tags.fromJson(v));
      });
    }
  }
  List<Tags>? _withImage;
  List<Tags>? _withoutImage;
Data copyWith({  List<Tags>? withImage,
  List<Tags>? withoutImage,
}) => Data(  withImage: withImage ?? _withImage,
  withoutImage: withoutImage ?? _withoutImage,
);
  List<Tags>? get withImage => _withImage;
  List<Tags>? get withoutImage => _withoutImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_withImage != null) {
      map['with_image'] = _withImage?.map((v) => v.toJson()).toList();
    }
    if (_withoutImage != null) {
      map['without_image'] = _withoutImage?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
