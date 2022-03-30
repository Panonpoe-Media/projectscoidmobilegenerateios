import 'commons/commons.dart';

class ListMessageModel {
  Attachment? attachment;
  String? channel;
  int? sentTimestamp;
  String? user;
  String? to;
  String? sessionId;
  String? type;
  String? sId;

  ListMessageModel(
      {this.attachment,
      this.channel,
      this.sentTimestamp,
      this.user,
      this.to,
      this.sessionId,
      this.type,
      this.sId});

  ListMessageModel.fromJson(Map<String, dynamic> json) {
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