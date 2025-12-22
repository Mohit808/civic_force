
class TagsModel {
  TagsModel({
      String? message, 
      num? status, 
      num? totalCities, 
      PostStats? postStats, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _totalCities = totalCities;
    _postStats = postStats;
    _data = data;
}

  TagsModel.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _totalCities = json['total_cities'];
    _postStats = json['post_stats'] != null ? PostStats.fromJson(json['post_stats']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _message;
  num? _status;
  num? _totalCities;
  PostStats? _postStats;
  List<Data>? _data;
TagsModel copyWith({  String? message,
  num? status,
  num? totalCities,
  PostStats? postStats,
  List<Data>? data,
}) => TagsModel(  message: message ?? _message,
  status: status ?? _status,
  totalCities: totalCities ?? _totalCities,
  postStats: postStats ?? _postStats,
  data: data ?? _data,
);
  String? get message => _message;
  num? get status => _status;
  num? get totalCities => _totalCities;
  PostStats? get postStats => _postStats;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    map['total_cities'] = _totalCities;
    if (_postStats != null) {
      map['post_stats'] = _postStats?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      num? id, 
      num? postCount, 
      String? name, 
      String? image, 
      String? state, 
      String? country,}){
    _id = id;
    _postCount = postCount;
    _name = name;
    _image = image;
    _state = state;
    _country = country;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _postCount = json['post_count'];
    _name = json['name'];
    _image = json['image'];
    _state = json['state'];
    _country = json['country'];
  }
  num? _id;
  num? _postCount;
  String? _name;
  String? _image;
  String? _state;
  String? _country;
Data copyWith({  num? id,
  num? postCount,
  String? name,
  String? image,
  String? state,
  String? country,
}) => Data(  id: id ?? _id,
  postCount: postCount ?? _postCount,
  name: name ?? _name,
  image: image ?? _image,
  state: state ?? _state,
  country: country ?? _country,
);
  num? get id => _id;
  num? get postCount => _postCount;
  String? get name => _name;
  String? get image => _image;
  String? get state => _state;
  String? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['post_count'] = _postCount;
    map['name'] = _name;
    map['image'] = _image;
    map['state'] = _state;
    map['country'] = _country;
    return map;
  }

}

class PostStats {
  PostStats({
      LastWeek? lastWeek, 
      LastMonth? lastMonth, 
      LastYear? lastYear,}){
    _lastWeek = lastWeek;
    _lastMonth = lastMonth;
    _lastYear = lastYear;
}

  PostStats.fromJson(dynamic json) {
    _lastWeek = json['last_week'] != null ? LastWeek.fromJson(json['last_week']) : null;
    _lastMonth = json['last_month'] != null ? LastMonth.fromJson(json['last_month']) : null;
    _lastYear = json['last_year'] != null ? LastYear.fromJson(json['last_year']) : null;
  }
  LastWeek? _lastWeek;
  LastMonth? _lastMonth;
  LastYear? _lastYear;
PostStats copyWith({  LastWeek? lastWeek,
  LastMonth? lastMonth,
  LastYear? lastYear,
}) => PostStats(  lastWeek: lastWeek ?? _lastWeek,
  lastMonth: lastMonth ?? _lastMonth,
  lastYear: lastYear ?? _lastYear,
);
  LastWeek? get lastWeek => _lastWeek;
  LastMonth? get lastMonth => _lastMonth;
  LastYear? get lastYear => _lastYear;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_lastWeek != null) {
      map['last_week'] = _lastWeek?.toJson();
    }
    if (_lastMonth != null) {
      map['last_month'] = _lastMonth?.toJson();
    }
    if (_lastYear != null) {
      map['last_year'] = _lastYear?.toJson();
    }
    return map;
  }

}

class LastYear {
  LastYear({
      num? current, 
      num? previous,}){
    _current = current;
    _previous = previous;
}

  LastYear.fromJson(dynamic json) {
    _current = json['current'];
    _previous = json['previous'];
  }
  num? _current;
  num? _previous;
LastYear copyWith({  num? current,
  num? previous,
}) => LastYear(  current: current ?? _current,
  previous: previous ?? _previous,
);
  num? get current => _current;
  num? get previous => _previous;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current'] = _current;
    map['previous'] = _previous;
    return map;
  }

}

class LastMonth {
  LastMonth({
      num? current, 
      num? previous,}){
    _current = current;
    _previous = previous;
}

  LastMonth.fromJson(dynamic json) {
    _current = json['current'];
    _previous = json['previous'];
  }
  num? _current;
  num? _previous;
LastMonth copyWith({  num? current,
  num? previous,
}) => LastMonth(  current: current ?? _current,
  previous: previous ?? _previous,
);
  num? get current => _current;
  num? get previous => _previous;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current'] = _current;
    map['previous'] = _previous;
    return map;
  }

}

class LastWeek {
  LastWeek({
      num? current, 
      num? previous,}){
    _current = current;
    _previous = previous;
}

  LastWeek.fromJson(dynamic json) {
    _current = json['current'];
    _previous = json['previous'];
  }
  num? _current;
  num? _previous;
LastWeek copyWith({  num? current,
  num? previous,
}) => LastWeek(  current: current ?? _current,
  previous: previous ?? _previous,
);
  num? get current => _current;
  num? get previous => _previous;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current'] = _current;
    map['previous'] = _previous;
    return map;
  }

}