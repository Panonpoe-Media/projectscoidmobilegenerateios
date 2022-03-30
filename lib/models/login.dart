
import 'package:json_annotation/json_annotation.dart';
part 'login.g.dart';

//{"result":"OK","user_id":"39111191814","user_name":"AhmadRiki","user_display":"&quot; onmouseover=&quot;alert(1)&quot;&gt;","user_photo":"https:\/\/cdn.projects.co.id\/upload\/usr6a1611\/201904225cbdafa7438b2-thumb.jpg","user_hash":"6a1611"}
//{"result":"ERR","errors":["Wrong username or password."]}

@JsonSerializable()
class LoginItem{

  String?  result;
  String?  user_id;
  String?  user_name;
  String?  user_display;
  String?  user_photo;
  String?  user_hash;
  String? notif_count;
  String?  hash;


  LoginItem(
      this.result,
      this.user_id,
      this.user_name,
      this.user_display,
      this.user_hash,
      this.notif_count,
      this.user_photo,
      );


  factory LoginItem.fromJson(Map<String, dynamic> json) => _$LoginItemFromJson(json);

  Map<String, dynamic> toJson() => _$LoginItemToJson(this);

}



@JsonSerializable()
class LoginResult{

  String?  result;

  LoginResult(
      this.result,
      );


  factory LoginResult.fromJson(Map<String, dynamic> json) => _$LoginResultFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResultToJson(this);

}