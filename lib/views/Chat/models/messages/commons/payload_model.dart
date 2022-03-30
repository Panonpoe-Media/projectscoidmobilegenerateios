import 'commons.dart';

class Payload {
  String? templateType;
  String? topElementStyle;
  String? url;
  String? text;
  List<Elements>? elements;
  List<Buttons>? buttons;
  List<ModalAnswers>? modalAnswers;

  Payload({
    this.templateType,
    this.topElementStyle,
    this.url,
    this.elements,
    this.buttons,
  });

  Payload.fromJson(Map<String, dynamic> json) {
    templateType = json['template_type'];
    topElementStyle = json['top_element_style'];
    url = json['url'];
    text = json['text'];
    if (json['elements'] != null) {
      elements = [];
      json['elements'].forEach((v) {
        elements?.add(new Elements.fromJson(v));
      });
    }
    if (json['buttons'] != null) {
      buttons = [];
      json['buttons'].forEach((v) {
        buttons?.add(new Buttons.fromJson(v));
      });
    }
    if (json['modalAnswers'] != null) {
      modalAnswers = [];
      json['modalAnswers'].forEach((v) {
        modalAnswers?.add(new ModalAnswers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['template_type'] = templateType;
    data['top_element_style'] = topElementStyle;
    data['url'] = url;
    data['text'] = text;
    if (elements != null) {
      data['elements'] = elements?.map((v) => v.toJson()).toList();
    }
    if (buttons != null) {
      data['buttons'] = this.buttons?.map((v) => v.toJson()).toList();
    }
    if (modalAnswers != null) {
      data['modalAnswers'] = modalAnswers?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ModalAnswers {
  String? contentType;
  String? title;
  String? payload;

  ModalAnswers({this.contentType, this.title, this.payload});

  ModalAnswers.fromJson(Map<String, dynamic> json) {
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
