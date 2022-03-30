import 'commons.dart';

class Elements {
  String? title;
  String? imageUrl;
  String? subtitle;
  List<Buttons>? buttons;
  DefaultAction? defaultAction;

  Elements(
      {this.title,
      this.imageUrl,
      this.subtitle,
      this.buttons,
      this.defaultAction});

  Elements.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    imageUrl = json['image_url'];
    subtitle = json['subtitle'];
    defaultAction = json['default_action'] != null
        ? new DefaultAction.fromJson(json['default_action'])
        : null;
    if (json['buttons'] != null) {
      buttons = [];
      json['buttons'].forEach((v) {
        buttons?.add(new Buttons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image_url'] = this.imageUrl;
    data['subtitle'] = this.subtitle;
    if (this.buttons != null) {
      data['buttons'] = this.buttons?.map((v) => v.toJson()).toList();
    }
    if (this.defaultAction != null) {
      data['default_action'] = this.defaultAction?.toJson();
    }
    return data;
  }
}

class DefaultAction {
  String? type;
  String? url;

  DefaultAction({this.type, this.url});

  DefaultAction.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}
