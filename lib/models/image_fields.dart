
import 'package:json_annotation/json_annotation.dart';
part 'image_fields.g.dart';



@JsonSerializable()
class ImageField{

  String?  status;
  String?  name;
  String?  temp;


  ImageField(
      this.status,
      this.name,
      this.temp,
      );


  factory ImageField.fromJson(Map<String, dynamic> json) => _$ImageFieldFromJson(json);

  Map<String, dynamic> toJson() => _$ImageFieldToJson(this);

}