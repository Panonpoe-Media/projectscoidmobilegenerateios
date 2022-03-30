class LoginMsgModel {
  String? cmd;
  String? auth;


  LoginMsgModel(
      {this.cmd = "me",
        this.auth = "socket",
      });

  LoginMsgModel.fromJson(Map<String, dynamic> json) {
    cmd = json['cmd'];
    auth = json['auth'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cmd'] = this.cmd;
    data['auth'] = this.auth;
    return data;
  }
}