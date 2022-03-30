class QuickReplyMessageModel {
  String? text;
  List<QuickReplies>? quickReplies;
  String? channel;
  int? sentTimestamp;
  String? user;
  String? to;
  String? sessionId;
  String? type;
  String? sId;

  QuickReplyMessageModel(
      {this.text,
      this.quickReplies,
      this.channel,
      this.sentTimestamp,
      this.user,
      this.to,
      this.sessionId,
      this.type,
      this.sId});

  QuickReplyMessageModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    if (json['quick_replies'] != null) {
      quickReplies = [];
      json['quick_replies'].forEach((v) {
        quickReplies?.add(QuickReplies.fromJson(v));
      });
    }
    channel = json['channel'];
    sentTimestamp = json['sent_timestamp'];
    user = json['user'];
    to = json['to'];
    sessionId = json['sessionId'];
    type = json['type'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    if (quickReplies != null) {
      data['quick_replies'] = quickReplies?.map((v) => v.toJson()).toList();
    }
    data['channel'] = channel;
    data['sent_timestamp'] = sentTimestamp;
    data['user'] = user;
    data['to'] = to;
    data['sessionId'] = sessionId;
    data['type'] = type;
    data['_id'] = sId;
    return data;
  }
}

class QuickReplies {
  String? contentType;
  String? title;
  String? payload;

  QuickReplies({this.contentType, this.title, this.payload});

  QuickReplies.fromJson(Map<String, dynamic> json) {
    contentType = json['content_type'];
    title = json['title'];
    payload = json['payload'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content_type'] = contentType;
    data['title'] = title;
    data['payload'] = payload;
    return data;
  }
}
