
import 'package:json_annotation/json_annotation.dart';
part 'file_fields.g.dart';

@JsonSerializable()
class FileField {

  String? status;
  String? name;
  int? size;
  int? created;
  int? modified;
  String? temp;
  String? remote;
  String? dir;
  String? date;



  FileField(this.status,
      this.name,
	  this.size,
	  this.created,
	  this.modified,	  
      this.temp,
	  this.remote,
	  this.dir,
      this.date,
      );

  factory FileField.fromJson(Map<String, dynamic> json) => _$FileFieldFromJson(json);

  Map<String, dynamic> toJson() => _$FileFieldToJson(this);

}


