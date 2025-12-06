
class CityModel {
  CityModel({
      String? message, 
      num? status, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  CityModel.fromJson(dynamic json) {
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
CityModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => CityModel(  message: message ?? _message,
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

/// id : 4
/// name : "Prayagraj Division"
/// image : null
/// state : "Uttar Pradesh"
/// country : "India"

class Data {
  Data({
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

  Data.fromJson(dynamic json) {
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
Data copyWith({  num? id,
  String? name,
  dynamic image,
  String? state,
  String? country,
}) => Data(  id: id ?? _id,
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