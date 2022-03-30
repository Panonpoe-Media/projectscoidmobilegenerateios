
import 'package:json_annotation/json_annotation.dart';
part 'selection.g.dart';


@JsonSerializable()
class Selection{
  String? url;
  String? key;
  String? value;
  String? text;
  bool?   selected;


  Selection(
      this.url,
      this.key,
      this.value,
      this.text,
      this.selected,

      );

  factory Selection.fromJson(Map<String, dynamic> json) => _$SelectionFromJson(json);

  Map<String, dynamic> toJson() => _$SelectionToJson(this);

}


