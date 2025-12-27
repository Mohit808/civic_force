
class ChatMessageModel {
  ChatMessageModel({
      String? message, 
      num? status, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  ChatMessageModel.fromJson(dynamic json) {
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
ChatMessageModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => ChatMessageModel(  message: message ?? _message,
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


class Data {
  Data({
      num? id, 
      String? message, 
      String? type, 
      String? mediaType, 
      String? mediaUrl, 
      dynamic replyId, 
      String? replyText, 
      dynamic replyUser,
      dynamic mediaSize,
      bool? read,
      String? createdAt, 
      num? sender, 
      num? receiver,}){
    _id = id;
    _message = message;
    _type = type;
    _mediaType = mediaType;
    _mediaUrl = mediaUrl;
    _replyId = replyId;
    _replyText = replyText;
    _replyUser = replyUser;
    _mediaSize = mediaSize;
    _read = read;
    _createdAt = createdAt;
    _sender = sender;
    _receiver = receiver;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _message = json['message'];
    _type = json['type'];
    _mediaType = json['media_type'];
    _mediaUrl = json['media_url'];
    _replyId = json['reply_id'];
    _replyText = json['reply_text'];
    _replyUser = json['reply_user'];
    _mediaSize = json['media_size'];
    _read = json['read'];
    _createdAt = json['created_at'];
    _sender = json['sender'];
    _receiver = json['receiver'];
  }
  num? _id;
  String? _message;
  String? _type;
  String? _mediaType;
  String? _mediaUrl;
  dynamic _replyId;
  String? _replyText;
  dynamic _replyUser;
  dynamic _mediaSize;
  bool? _read;
  String? _createdAt;
  num? _sender;
  num? _receiver;
Data copyWith({  num? id,
  String? message,
  String? type,
  String? mediaType,
  String? mediaUrl,
  dynamic replyId,
  String? replyText,
  dynamic mediaSize,
  dynamic replyUser,
  bool? read,
  String? createdAt,
  num? sender,
  num? receiver,
}) => Data(  id: id ?? _id,
  message: message ?? _message,
  type: type ?? _type,
  mediaType: mediaType ?? _mediaType,
  mediaUrl: mediaUrl ?? _mediaUrl,
  replyId: replyId ?? _replyId,
  replyText: replyText ?? _replyText,
  mediaSize: mediaSize ?? _mediaSize,
  replyUser: replyUser ?? _replyUser,
  read: read ?? _read,
  createdAt: createdAt ?? _createdAt,
  sender: sender ?? _sender,
  receiver: receiver ?? _receiver,
);
  num? get id => _id;
  String? get message => _message;
  String? get type => _type;
  String? get mediaType => _mediaType;
  String? get mediaUrl => _mediaUrl;
  dynamic get replyId => _replyId;
  String? get replyText => _replyText;
  dynamic get mediaSize => _mediaSize;
  dynamic get replyUser => _replyUser;
  bool? get read => _read;
  String? get createdAt => _createdAt;
  num? get sender => _sender;
  num? get receiver => _receiver;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['message'] = _message;
    map['type'] = _type;
    map['media_type'] = _mediaType;
    map['media_url'] = _mediaUrl;
    map['reply_id'] = _replyId;
    map['reply_text'] = _replyText;
    map['media_size'] = _mediaSize;
    map['reply_user'] = _replyUser;
    map['read'] = _read;
    map['created_at'] = _createdAt;
    map['sender'] = _sender;
    map['receiver'] = _receiver;
    return map;
  }

}