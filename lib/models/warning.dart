
import 'package:json_annotation/json_annotation.dart';
part 'warning.g.dart';



@JsonSerializable()
class Warning{
  String type;
  String title;
  String message;

  


  Warning(
      this.type,
      this.title,
      this.message
      );

  factory Warning.fromJson(Map<String, dynamic> json) => _$WarningFromJson(json);

  Map<String, dynamic> toJson() => _$WarningToJson(this);

}


