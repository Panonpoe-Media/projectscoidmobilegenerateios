
import 'package:json_annotation/json_annotation.dart';
part 'page.g.dart';

  


@JsonSerializable()
class Page1{
  String title;
  String content;
  Page1(
      this.title,
      this.content,
      );

  factory Page1.fromJson(Map<String, dynamic> json) => _$Page1FromJson(json);

  Map<String, dynamic> toJson() => _$Page1ToJson(this);

}


