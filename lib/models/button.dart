
import 'package:json_annotation/json_annotation.dart';
import 'selection.dart';
part 'button.g.dart';



@JsonSerializable()
class Button{
  String? id;
  String? url ;
  String? color;
  String? icon;
  String? badge;
  String? text ;
  String? type;
  List<Selection?>? selections;


  Button(
      this.id ,
      this.url ,
      this.color,
      this.icon,
      this.badge,
      this.text,
	  this.type,
	  this.selections
      );

  factory Button.fromJson(Map<String, dynamic> json) => _$ButtonFromJson(json);

  Map<String, dynamic> toJson() => _$ButtonToJson(this);

}


