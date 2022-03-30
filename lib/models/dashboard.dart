
import 'package:json_annotation/json_annotation.dart';
import 'selection.dart';
part 'dashboard.g.dart';



@JsonSerializable()
class Dashboard{
  String title ;
  String url;
  String icon;
  String color;
  String value;



  Dashboard(
      this.title ,
      this.url,
      this.icon,
      this.color,
      this.value
      );

  factory Dashboard.fromJson(Map<String, dynamic> json) => _$DashboardFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardToJson(this);

}


