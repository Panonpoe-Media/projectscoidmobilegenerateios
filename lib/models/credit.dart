
import 'package:json_annotation/json_annotation.dart';
part 'credit.g.dart';

  


@JsonSerializable()
class Credit{
  int? no;
  DateTime? date;
  String? type;
  String? title;
  double? balance;
  double? amount;
  
  List<int?>? order;
  List<String?>?  order_str;
  List<String?>? order_url;

  
  List<int?>? user;
  List<String?>?  user_str;
  List<String?>? user_url;

  
  List<int?>? projects;
  List<String?>?  projects_str;
  List<String?>? projects_url;



  Credit(
      this.no,
      this.date,
      this.type,
      this.title,
      this.balance,
	  this.amount,
	  this.order,
	  this.order_str,
	  this.order_url,
	  this.user,
	  this.user_str,
	  this.user_url,
	  this.projects,
	  this.projects_str,
	  this.projects_url,
      );

  factory Credit.fromJson(Map<String, dynamic> json) => _$CreditFromJson(json);

  Map<String, dynamic> toJson() => _$CreditToJson(this);

}


