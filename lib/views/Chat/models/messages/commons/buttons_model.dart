class Buttons {
  String? title;
  String? type;
  String? url;
  String? payload;
  bool? messengerExtensions;

  Buttons({this.title, this.type, this.url, this.payload, this.messengerExtensions});

  Buttons.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    type = json['type'];
    url = json['url'];
    payload = json['payload'];
    messengerExtensions = json['messenger_extensions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['type'] = type;
    data['url'] = url;
    data['payload'] = payload;
    data['messenger_extensions'] = messengerExtensions;
    return data;
  }
}
