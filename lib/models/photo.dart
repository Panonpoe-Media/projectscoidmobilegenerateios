
import 'package:json_annotation/json_annotation.dart';
part 'photo.g.dart';


@JsonSerializable()
class Photo{
  String? name;
  String? status;
  String? dir;
  String? file;
  String? thumb;
  String? temp;
  Photo(
      this.name,
	  this.status,
      this.dir,
      this.file,
      this.thumb,
	  this.temp,
      );

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);

}


