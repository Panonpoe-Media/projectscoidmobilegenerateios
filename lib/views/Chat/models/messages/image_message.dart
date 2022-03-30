import 'commons/commons.dart';

class ImageMessageModel {
  Attachment? attachment;
  String? channel;
  int? sentTimestamp;
  String? user;
  String? to;
  String? sessionId;
  String? type;
  String? sId;

  ImageMessageModel(
      {this.attachment,
      this.channel,
      this.sentTimestamp,
      this.user,
      this.to,
      this.sessionId,
      this.type,
      this.sId});

  ImageMessageModel.fromJson(Map<String, dynamic> json) {
    attachment = json['attachment'] != null
        ? Attachment.fromJson(json['attachment'])
        : null;
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
    if (attachment != null) {
      data['attachment'] = attachment?.toJson();
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

class Settings {
  String? header;
  String? display;
  String? openingMode;

  Settings({this.header, this.display, this.openingMode});

  Settings.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    display = json['display'];
    openingMode = json['openingMode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['display'] = this.display;
    data['openingMode'] = this.openingMode;
    return data;
  }
}
