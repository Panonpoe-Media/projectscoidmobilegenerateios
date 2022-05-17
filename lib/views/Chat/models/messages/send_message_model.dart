class SendMessageModel {
  String? author;
  String? channel;
  String? type;
  String? user;
  String? text;
  String? payloadTitle;

  SendMessageModel(
      {this.author = "me",
      this.channel = "socket",
      this.type = "message",
      this.user,
      this.text,
      this.payloadTitle});

  SendMessageModel.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    channel = json['channel'];
    type = json['type'];
    user = json['user'];
    text = json['text'];
    payloadTitle = json['payloadTitle'];
 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = author;
    data['channel'] = channel;
    data['type'] = type;
    data['user'] = user;
    data['text'] = text;
    data['payloadTitle'] = payloadTitle;
    return data;
  }
}


/*
   "cmd":"send",
    "receiver":"<user_id>",
    "message":"<isi_message>",
    "attachment":"<url_attachment>"
 */
/*
 "cmd":"message",
    "thread":"abc123/def456",
    "message":"<isi_message>"
 */
class SendMsgModel {
  int? type;
  String? thread;
  String? sender;
  String? userid;
  String? message;
  int? time;
  int? status;


  SendMsgModel(
      {this.type ,
        this.thread ,
        this.sender,
        this.userid,
        this.message,
        this.time,
        this.status
      });

  SendMsgModel.fromJson(Map<String, dynamic> json) {
    type = json['msgtype'] as int?;
    thread = json['thread'];
    message = json['message'];
    sender = json['sender'];
    userid = json['userid'];
    time = json['time'] as int?;
    status = json['rcvstatus'] as int?;



  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msgtype'] = type;
    data['thread'] = thread;
    data['message'] = message;
    data['sender'] = sender;
    data['time'] = time;
    return data;
  }
}

class SendMsgModel1 {
  String? cmd;
  String? thread;
  String? message;
  String? attachment;


  SendMsgModel1(
      {this.cmd = 'message',
        this.thread ,
        this.message,
        this.attachment
       });

  SendMsgModel1.fromJson(Map<String, dynamic> json) {
    cmd = json['cmd'];
    thread = json['thread'];
    message = json['message'];
    attachment = json['attachment'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cmd'] = cmd;
    data['thread'] = thread;
    data['message'] = message;
    data['attachment'] = attachment;
    return data;
  }
}

class SendTypingModel {
  String? cmd;
  String? thread;


  SendTypingModel(
      {this.cmd = 'typing',
        this.thread ,

      });

  SendTypingModel.fromJson(Map<String, dynamic> json) {
    cmd = json['cmd'];
    thread = json['thread'];



  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cmd'] = cmd;
    data['thread'] = thread;


    return data;
  }
}
class GetOldMsgModel {
  String? cmd;
  String? thread;
  String? offset;
  String? userid;



  GetOldMsgModel(
      {this.cmd = '',
        this.thread ,
        this.offset,
        this.userid
      });

  GetOldMsgModel.fromJson(Map<String, dynamic> json) {
    cmd = json['cmd'];
    thread = json['thread'];
    offset = json['offset'];
    userid = json['userid'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cmd'] = cmd;
    data['thread'] = thread;
    data['offset'] = offset;
    data['userid'] = userid;

    return data;
  }
}
