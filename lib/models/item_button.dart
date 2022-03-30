
import 'package:json_annotation/json_annotation.dart';
part 'item_button.g.dart';



@JsonSerializable()
class ItemButton{
  String? url ;
  String? color;
  String? icon;
  String? badge;
  String? text ;

  ItemButton(
      this.url ,
      this.color,
      this.icon,
      this.badge,
      this.text,
      );

  factory ItemButton.fromJson(Map<String, dynamic> json) => _$ItemButtonFromJson(json);

  Map<String, dynamic> toJson() => _$ItemButtonToJson(this);

}


