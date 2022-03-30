class ChatHistortModel {
  bool? success;
  List<History>? history;
  String? error;

  ChatHistortModel({this.success, this.history});

  ChatHistortModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    if (json['history'] != null) {
      history = [];
      json['history'].forEach((v) {
        history?.add(History.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    data['error'] = error;
    if (history != null) {
      data['history'] = history?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class History {
  bool? favorite;
  String? sId;
  String? user;
  dynamic message;
  String? date;
  String? createdAt;
  String? updatedAt;
  int? iV;

  History(
      {this.favorite,
      this.sId,
      this.user,
      this.message,
      this.date,
      this.createdAt,
      this.updatedAt,
      this.iV});

  History.fromJson(Map<String, dynamic> json) {
    favorite = json['favorite'];
    sId = json['_id'];
    user = json['user'];
    message = json['message'];
    date = json['date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favorite'] = favorite;
    data['_id'] = sId;
    data['user'] = user;
    data['message'] = message;
    data['date'] = date;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
