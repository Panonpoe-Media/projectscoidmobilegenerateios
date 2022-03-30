class TextMessageModel {
  String? text;
  String? user;
  String? channel;
  String? to;
  String? type;
  String? sId;

  TextMessageModel(
      {this.text, this.user, this.channel, this.to, this.type, this.sId});

  TextMessageModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    user = json['user'];
    channel = json['channel'];
    to = json['to'];
    type = json['type'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['user'] = this.user;
    data['channel'] = this.channel;
    data['to'] = this.to;
    data['type'] = this.type;
    data['_id'] = this.sId;
    return data;
  }
}
