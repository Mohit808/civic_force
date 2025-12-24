
import 'package:civic_force/model/user_model.dart';

class PollModel {
  PollModel({
      String? message, 
      num? status, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  PollModel.fromJson(dynamic json) {
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
PollModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => PollModel(  message: message ?? _message,
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

/// id : 1
/// user : {"id":1,"name":"Amit Yadav","email":null,"image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoFRQjM-wM_nXMA03AGDXgJK3VeX7vtD3ctA&s","user_id":3}
/// question : "Are you a morning, afternoon, evening or night person?"
/// is_multiple_choice : false
/// expires_at : "2025-12-17T11:22:41Z"
/// created_at : "2025-12-17T11:22:45.833222Z"
/// is_expired : true
/// options : [{"id":1,"text":"Morning","order":0,"vote_count":0,"poll":1},{"id":2,"text":"Afternoon","order":1,"vote_count":0,"poll":1},{"id":3,"text":"Evening","order":2,"vote_count":0,"poll":1},{"id":4,"text":"Night","order":3,"vote_count":0,"poll":1}]

class Data {
  Data({
      num? id, 
      UserInfo? user,
      String? question, 
      bool? isMultipleChoice, 
      String? expiresAt, 
      bool? hasVoted,
      String? createdAt,
      bool? isExpired, 
      List<Options>? options,}){
    _id = id;
    _user = user;
    _question = question;
    _isMultipleChoice = isMultipleChoice;
    _expiresAt = expiresAt;
    _createdAt = createdAt;
    _isExpired = isExpired;
    _hasVoted = hasVoted;
    _options = options;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _user = json['user'] != null ? UserInfo.fromJson(json['user']) : null;
    _question = json['question'];
    _isMultipleChoice = json['is_multiple_choice'];
    _expiresAt = json['expires_at'];
    _createdAt = json['created_at'];
    _hasVoted = json['has_voted'];
    _isExpired = json['is_expired'];
    if (json['options'] != null) {
      _options = [];
      json['options'].forEach((v) {
        _options?.add(Options.fromJson(v));
      });
    }
  }
  num? _id;
  UserInfo? _user;
  String? _question;
  bool? _isMultipleChoice;
  String? _expiresAt;
  String? _createdAt;
  bool? _hasVoted;
  bool? _isExpired;
  List<Options>? _options;
Data copyWith({  num? id,
  UserInfo? user,
  String? question,
  bool? isMultipleChoice,
  String? expiresAt,
  String? createdAt,
  bool? isExpired,
  bool? hasVoted,
  List<Options>? options,
}) => Data(  id: id ?? _id,
  user: user ?? _user,
  question: question ?? _question,
  isMultipleChoice: isMultipleChoice ?? _isMultipleChoice,
  expiresAt: expiresAt ?? _expiresAt,
  createdAt: createdAt ?? _createdAt,
  isExpired: isExpired ?? _isExpired,
  options: options ?? _options,
  hasVoted: hasVoted ?? _hasVoted,
);
  num? get id => _id;
  UserInfo? get user => _user;
  String? get question => _question;
  bool? get isMultipleChoice => _isMultipleChoice;
  String? get expiresAt => _expiresAt;
  String? get createdAt => _createdAt;
  bool? get isExpired => _isExpired;
  bool? get hasVoted => _hasVoted;
  List<Options>? get options => _options;


  set setVoted(value){
    _hasVoted=value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['question'] = _question;
    map['is_multiple_choice'] = _isMultipleChoice;
    map['expires_at'] = _expiresAt;
    map['created_at'] = _createdAt;
    map['is_expired'] = _isExpired;
    map['has_voted'] = _hasVoted;
    if (_options != null) {
      map['options'] = _options?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// text : "Morning"
/// order : 0
/// vote_count : 0
/// poll : 1

class Options {
  Options({
      num? id, 
      String? text, 
      num? order, 
      num? voteCount, 
      num? percentage,
      bool? isWinner,
      num? poll,}){
    _id = id;
    _text = text;
    _order = order;
    _voteCount = voteCount;
    _isWinner = isWinner;
    _percentage = percentage;
    _poll = poll;
}

  Options.fromJson(dynamic json) {
    _id = json['id'];
    _text = json['text'];
    _order = json['order'];
    _voteCount = json['vote_count'];
    _isWinner = json['is_winner'];
    _percentage = json['percentage'];
    _poll = json['poll'];
  }
  num? _id;
  String? _text;
  num? _order;
  num? _voteCount;
  bool? _isWinner;
  num? _percentage;
  num? _poll;
Options copyWith({  num? id,
  String? text,
  num? order,
  num? voteCount,
  num? poll,
}) => Options(  id: id ?? _id,
  text: text ?? _text,
  order: order ?? _order,
  voteCount: voteCount ?? _voteCount,
  poll: poll ?? _poll,
);
  num? get id => _id;
  String? get text => _text;
  num? get order => _order;
  num? get voteCount => _voteCount;
  num? get percentage => _percentage;
  num? get poll => _poll;
  bool? get isWinner => _isWinner;



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['text'] = _text;
    map['order'] = _order;
    map['vote_count'] = _voteCount;
    map['percentage'] = _percentage;
    map['poll'] = _poll;
    map['is-winner'] = _isWinner;
    return map;
  }

}
