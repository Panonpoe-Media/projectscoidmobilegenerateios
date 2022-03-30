import 'commons.dart';

class Attachment {
  String? type;
  Payload? payload;
  String? kind;
  List<dynamic>? mobile;

  Attachment({this.type, this.payload});

  Attachment.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    kind = json['kind'];
    payload =
        json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
    if (json['mobile'] != null) {
      mobile = [];
      json['mobile'].forEach((v) {
        mobile?.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> mobile = new Map<String, dynamic>();
    mobile['type'] = this.type;
    mobile['kind'] = this.kind;
    if (this.payload != null) {
      mobile['payload'] = this.payload?.toJson();
    }
    if (this.mobile != null) {
      mobile['mobile'] = this.mobile?.map((v) => v.toJson()).toList();
    }
    return mobile;
  }
}
