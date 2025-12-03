class UserModel {
  UserModel({
      String? message, 
      num? status, 
      Data? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  UserModel.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _message;
  num? _status;
  Data? _data;
UserModel copyWith({  String? message,
  num? status,
  Data? data,
}) => UserModel(  message: message ?? _message,
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

/// token : "9eb09fe166c238fefb237c896f2d2affe0e405ac"
/// userInfo : {"id":1,"phone_number":"9876543210","name":"Oops","image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyWLjkYKGswBE2f9mynFkd8oPT1W4Gx8RpDQ&s","email":null,"fcm_token":"d89WglETRyKisp--zGbMUG:APA91bEADq2ACwCgH7KI8XN4VTswQlvkzu4KzimBdVhmCm1LIf_qahjj4IhAxz3UqydOnO5RbLlBwrlx7QNIQS_DAXljAxAdUpV6Sa8k5liKq-6s75LPRJg","public_key":"aNOXFEE7MPXCNGx3rij/GQQ8+FHBOejUjacTGhCbbgE=","birth_date":"2019-06-06","height":"","weight":"","role":"top","relation_status":"single","about":"Zggz","country":"Angola","private_album":"https://oceann-chat.s3.ap-southeast-1.amazonaws.com/20251112135329_1000000523.jpg","created_at":"2025-11-12T06:15:03.259317Z","user_id":3}

class Data {
  Data({
      String? token, 
      UserInfo? userInfo,}){
    _token = token;
    _userInfo = userInfo;
}

  Data.fromJson(dynamic json) {
    _token = json['token'];
    _userInfo = json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null;
  }
  String? _token;
  UserInfo? _userInfo;
Data copyWith({  String? token,
  UserInfo? userInfo,
}) => Data(  token: token ?? _token,
  userInfo: userInfo ?? _userInfo,
);
  String? get token => _token;
  UserInfo? get userInfo => _userInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_userInfo != null) {
      map['userInfo'] = _userInfo?.toJson();
    }
    return map;
  }

}

class UserInfo {
  UserInfo({
      num? id, 
      String? phoneNumber, 
      String? name, 
      String? image, 
      dynamic email, 
      String? fcmToken, 
      String? publicKey, 
      String? birthDate, 
      String? height, 
      String? weight, 
      String? role, 
      String? relationStatus, 
      String? about, 
      String? country, 
      String? privateAlbum, 
      String? createdAt, 
      String? updatedAt,
      num? userId,
      dynamic distance,
      dynamic isVerified,
  }){
    _id = id;
    _phoneNumber = phoneNumber;
    _name = name;
    _image = image;
    _email = email;
    _fcmToken = fcmToken;
    _publicKey = publicKey;
    _birthDate = birthDate;
    _height = height;
    _weight = weight;
    _role = role;
    _relationStatus = relationStatus;
    _about = about;
    _country = country;
    _privateAlbum = privateAlbum;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _userId = userId;
    _distance = distance;
    _isVerified = isVerified;
}

  UserInfo.fromJson(dynamic json) {
    _id = json['id'];
    _phoneNumber = json['phone_number'];
    _name = json['name'];
    _image = json['image'];
    _email = json['email'];
    _fcmToken = json['fcm_token'];
    _publicKey = json['public_key'];
    _birthDate = json['birth_date'];
    _height = json['height'];
    _weight = json['weight'];
    _role = json['role'];
    _relationStatus = json['relation_status'];
    _about = json['about'];
    _country = json['country'];
    _privateAlbum = json['private_album'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _userId = json['user_id'];
    _distance = json['distance'];
    _isVerified = json['is_verified'];
  }
  num? _id;
  String? _phoneNumber;
  String? _name;
  String? _image;
  dynamic _email;
  String? _fcmToken;
  String? _publicKey;
  String? _birthDate;
  String? _height;
  String? _weight;
  String? _role;
  String? _relationStatus;
  String? _about;
  String? _country;
  String? _privateAlbum;
  String? _createdAt;
  String? _updatedAt;
  num? _userId;
  dynamic _distance;
  dynamic _isVerified;
UserInfo copyWith({  num? id,
  String? phoneNumber,
  String? name,
  String? image,
  dynamic email,
  String? fcmToken,
  String? publicKey,
  String? birthDate,
  String? height,
  String? weight,
  String? role,
  String? relationStatus,
  String? about,
  String? country,
  String? privateAlbum,
  String? createdAt,
  String? updatedAt,
  num? userId,
  dynamic distance,
  dynamic isVerified,
}) => UserInfo(  id: id ?? _id,
  phoneNumber: phoneNumber ?? _phoneNumber,
  name: name ?? _name,
  image: image ?? _image,
  email: email ?? _email,
  fcmToken: fcmToken ?? _fcmToken,
  publicKey: publicKey ?? _publicKey,
  birthDate: birthDate ?? _birthDate,
  height: height ?? _height,
  weight: weight ?? _weight,
  role: role ?? _role,
  relationStatus: relationStatus ?? _relationStatus,
  about: about ?? _about,
  country: country ?? _country,
  privateAlbum: privateAlbum ?? _privateAlbum,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  userId: userId ?? _userId,
  distance: distance ?? _distance,
  isVerified: isVerified ?? _isVerified,
);
  num? get id => _id;
  String? get phoneNumber => _phoneNumber;
  String? get name => _name;
  String? get image => _image;
  dynamic get email => _email;
  String? get fcmToken => _fcmToken;
  String? get publicKey => _publicKey;
  String? get birthDate => _birthDate;
  String? get height => _height;
  String? get weight => _weight;
  String? get role => _role;
  String? get relationStatus => _relationStatus;
  String? get about => _about;
  String? get country => _country;
  String? get privateAlbum => _privateAlbum;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get userId => _userId;
  dynamic get distance => _distance;
  dynamic get isVerified => _isVerified;

  setVerified(value){
    _isVerified=value;
  }

  setPhoneNumber(value){
    _phoneNumber=value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['phone_number'] = _phoneNumber;
    map['name'] = _name;
    map['image'] = _image;
    map['email'] = _email;
    map['fcm_token'] = _fcmToken;
    map['public_key'] = _publicKey;
    map['birth_date'] = _birthDate;
    map['height'] = _height;
    map['weight'] = _weight;
    map['role'] = _role;
    map['relation_status'] = _relationStatus;
    map['about'] = _about;
    map['country'] = _country;
    map['private_album'] = _privateAlbum;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['user_id'] = _userId;
    map['distance'] = _distance;
    map['is_verified'] = _isVerified;
    return map;
  }

}