
class ChatListModel {
  ChatListModel({
      String? message, 
      num? status, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  ChatListModel.fromJson(dynamic json) {
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
ChatListModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => ChatListModel(  message: message ?? _message,
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

/// user_id : 13
/// name : "Base user"
/// image : "https://i.pinimg.com/1200x/a3/50/60/a35060add776a578d4062d549ee1fb68.jpg"
/// last_message : "Hi"
/// last_message_time : "2025-12-26T05:35:59.606659Z"
/// unread_count : 1
/// last_message_by_you : false

class Data {
  Data({
      num? userId, 
      String? name, 
      String? image, 
      String? lastMessage, 
      String? lastMessageTime, 
      num? unreadCount, 
      bool? lastMessageByYou,}){
    _userId = userId;
    _name = name;
    _image = image;
    _lastMessage = lastMessage;
    _lastMessageTime = lastMessageTime;
    _unreadCount = unreadCount;
    _lastMessageByYou = lastMessageByYou;
}

  Data.fromJson(dynamic json) {
    _userId = json['user_id'];
    _name = json['name'];
    _image = json['image'];
    _lastMessage = json['last_message'];
    _lastMessageTime = json['last_message_time'];
    _unreadCount = json['unread_count'];
    _lastMessageByYou = json['last_message_by_you'];
  }
  num? _userId;
  String? _name;
  String? _image;
  String? _lastMessage;
  String? _lastMessageTime;
  num? _unreadCount;
  bool? _lastMessageByYou;
Data copyWith({  num? userId,
  String? name,
  String? image,
  String? lastMessage,
  String? lastMessageTime,
  num? unreadCount,
  bool? lastMessageByYou,
}) => Data(  userId: userId ?? _userId,
  name: name ?? _name,
  image: image ?? _image,
  lastMessage: lastMessage ?? _lastMessage,
  lastMessageTime: lastMessageTime ?? _lastMessageTime,
  unreadCount: unreadCount ?? _unreadCount,
  lastMessageByYou: lastMessageByYou ?? _lastMessageByYou,
);
  num? get userId => _userId;
  String? get name => _name;
  String? get image => _image;
  String? get lastMessage => _lastMessage;
  String? get lastMessageTime => _lastMessageTime;
  num? get unreadCount => _unreadCount;
  bool? get lastMessageByYou => _lastMessageByYou;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['name'] = _name;
    map['image'] = _image;
    map['last_message'] = _lastMessage;
    map['last_message_time'] = _lastMessageTime;
    map['unread_count'] = _unreadCount;
    map['last_message_by_you'] = _lastMessageByYou;
    return map;
  }

}