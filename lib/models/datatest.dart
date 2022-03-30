
import 'package:json_annotation/json_annotation.dart';
import 'image_fields.dart';
import 'file_fields.dart';
part 'datatest.g.dart';

@JsonSerializable()
class DataTest{

  String? user_name;
  String? password;
  String? email;
  String?display_name;
  String?title;
  String?handphone;
  String?multiline;
  String?address;
  String?percent;
  String?test;
  ImageField? image;
  FileField? file;
  String?captcha;
  String?rating;
  String?datetime;
  String?date;
  String?time;
  String?article;
  String?money;
  String?number;
  String?double;
  String?boolean;
  String?model;
  int? angka;
  bool? boolean1;
  List<String?>? model_selection;
  String?enume;
  List<String?>? enum_selection;
  String?website;
  List<String?>? inline_tags;
  List<String?>? inline_tags_selection;



   DataTest(
      this.user_name,
      this.password,
      this.email,
      this.display_name,
      this.title,
      this.handphone,
      this.multiline,
      this.address,
      this.percent,
      this.test,
      this.angka,
      this.boolean1,
      this.image,
      this.file,
      this.captcha,
      this.rating,
      this.datetime,
      this.date,
      this.time,
      this.article,
      this.money,
      this.number,
      this.double,
      this.boolean,
      this.enume,
      this.enum_selection,
      this.model,
      this.model_selection,
      this.website,
      this.inline_tags,
      this.inline_tags_selection,
      );


  factory DataTest.fromJson(Map<String, dynamic> json) => _$DataTestFromJson(json);

  Map<String, dynamic> toJson() => _$DataTestToJson(this);

}
/*@JsonSerializable()
class EnumeSelection{
  String?a11;
  String?a33;
  String?a77;
  EnumeSelection();
} */

