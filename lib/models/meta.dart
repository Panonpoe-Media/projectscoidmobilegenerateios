
import 'package:json_annotation/json_annotation.dart';
import 'warning.dart';
part 'meta.g.dart';



@JsonSerializable()
class Meta{
  String? before_title;
  String? title;
  String? after_title;
  String? before_view;
  String? after_view;
  String? before_edit;
  String? after_edit;
  String? before_add;
  String? after_add;
  String? include_before;
  String? include_after;
  Warning? warning;
  String? before_content;
  String? after_content;
  


  Meta(
      this.before_title,
      this.title,
      this.after_title,
	  this.before_view,
	  this.after_view,
	  this.before_edit,
	  this.after_edit,
	  this.before_add,
	  this.after_add,	
      this.include_before,
      this.include_after,
      this.before_content,
	  this.after_content
      );

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);

}


