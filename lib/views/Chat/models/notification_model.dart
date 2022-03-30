class NotificationModel {
  String? from;
  String? collapseKey;
  Notification? notification;

  NotificationModel({this.from, this.collapseKey, this.notification});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    collapseKey = json['collapse_key'];
    notification = json['notification'] != null
        ? Notification.fromJson(json['notification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = this.from;
    data['collapse_key'] = this.collapseKey;
    if (notification != null) {
      data['notification'] = this.notification?.toJson();
    }
    return data;
  }
}

class Notification {
  String? body;
  int? e;
  String? tag;

  Notification({this.body, this.e, this.tag});

  Notification.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    e = json['e'];
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['e'] = this.e;
    data['tag'] = this.tag;
    return data;
  }
}
