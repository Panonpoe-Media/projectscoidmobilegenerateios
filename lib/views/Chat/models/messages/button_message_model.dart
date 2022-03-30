import 'commons/attachement_model.dart';

class ButtonMessageModel {
  Attachment? attachment;
  String? channel;
  int? sentTimestamp;
  String? user;
  String? to;
  String? sessionId;
  String? type;

  ButtonMessageModel(
      {this.attachment,
      this.channel,
      this.sentTimestamp,
      this.user,
      this.to,
      this.sessionId,
      this.type});

  ButtonMessageModel.fromJson(Map<String, dynamic> json) {
    attachment = json['attachment'] != null
        ? new Attachment.fromJson(json['attachment'])
        : null;
    channel = json['channel'];
    sentTimestamp = json['sent_timestamp'];
    user = json['user'];
    to = json['to'];
    sessionId = json['sessionId'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attachment != null) {
      data['attachment'] = this.attachment?.toJson();
    }
    data['channel'] = this.channel;
    data['sent_timestamp'] = this.sentTimestamp;
    data['user'] = this.user;
    data['to'] = this.to;
    data['sessionId'] = this.sessionId;
    data['type'] = this.type;
    return data;
  }
}
