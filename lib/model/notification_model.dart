import 'package:civic_force/model/user_model.dart';

import 'post_model.dart' as pm;
import 'reply_comment_model.dart' as rm;
import 'comment_model.dart' as cm;
class NotificationModel {
  NotificationModel({
      String? message, 
      num? status, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  NotificationModel.fromJson(dynamic json) {
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
NotificationModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => NotificationModel(  message: message ?? _message,
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
      UserInfo? sender,
      pm.Data? post,
      cm.Data? comment,
      rm.Data? replyComment,
      String? notificationType, 
      bool? isRead, 
      bool? isArchived,
      String? message,
      String? createdAt, 
      num? user, 
      num? poll,}){
    _id = id;
    _sender = sender;
    _post = post;
    _comment = comment;
    _replyComment = replyComment;
    _notificationType = notificationType;
    _isRead = isRead;
    _isArchived = isArchived;
    _message = message;
    _createdAt = createdAt;
    _user = user;
    _poll = poll;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _sender = json['sender'] != null ? UserInfo.fromJson(json['sender']) : null;
    _post = json['post'] != null ? pm.Data.fromJson(json['post']) : null;
    _comment = json['comment'] != null ? cm.Data.fromJson(json['comment']) : null;
    _replyComment = json['reply_comment'] != null ? rm.Data.fromJson(json['reply_comment']) : null;
    _notificationType = json['notification_type'];
    _isRead = json['is_read'];
    _isArchived = json['is_archived'];
    _message = json['message'];
    _createdAt = json['created_at'];
    _user = json['user'];
    _poll = json['poll'];
  }
  num? _id;
  UserInfo? _sender;
  pm.Data? _post;
  cm.Data? _comment;
  rm.Data? _replyComment;
  String? _notificationType;
  bool? _isRead;
  bool? _isArchived;
  String? _message;
  String? _createdAt;
  num? _user;
  num? _poll;
Data copyWith({  num? id,
  UserInfo? sender,
  pm.Data? post,
  cm.Data? comment,
  rm.Data? replyComment,
  String? notificationType,
  bool? isRead,
  bool? isArchived,
  String? message,
  String? createdAt,
  num? user,
  num? poll,
}) => Data(  id: id ?? _id,
  sender: sender ?? _sender,
  post: post ?? _post,
  comment: comment ?? _comment,
  replyComment: replyComment ?? _replyComment,
  notificationType: notificationType ?? _notificationType,
  isRead: isRead ?? _isRead,
  isArchived: isArchived ?? _isArchived,
  message: message ?? _message,
  createdAt: createdAt ?? _createdAt,
  user: user ?? _user,
  poll: poll ?? _poll,
);
  num? get id => _id;
  UserInfo? get sender => _sender;
  pm.Data? get post => _post;
  cm.Data? get comment => _comment;
  rm.Data? get replyComment => _replyComment;
  String? get notificationType => _notificationType;
  bool? get isRead => _isRead;
  bool? get isArchived => _isArchived;
  String? get message => _message;
  String? get createdAt => _createdAt;
  num? get user => _user;
  num? get poll => _poll;

  set setArchived(value){
    _isArchived=value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_sender != null) {
      map['sender'] = _sender?.toJson();
    }
    if (_post != null) {
      map['post'] = _post?.toJson();
    }
    if (_comment != null) {
      map['comment'] = _comment?.toJson();
    }
    if (_replyComment != null) {
      map['reply_comment'] = _replyComment?.toJson();
    }
    map['notification_type'] = _notificationType;
    map['is_read'] = _isRead;
    map['is_archived'] = _isArchived;
    map['message'] = _message;
    map['created_at'] = _createdAt;
    map['user'] = _user;
    map['poll'] = _poll;
    return map;
  }
}