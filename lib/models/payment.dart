
import 'package:json_annotation/json_annotation.dart';
part 'payment.g.dart';




@JsonSerializable()
class Payment{
  int? no;
  DateTime? transfer_date;
  String? bank;
  double? amount;
  double? fee;
  String? direction;
  List<int?>? status;
  List<String?>?  status_str;
  List<String?>? status_url;


  Payment(
      this.no ,
      this.transfer_date,
      this.bank,
      this.amount,
      this.fee,
	  this.direction,
	  this.status,
	  this.status_str,
	  this.status_url,
      );

  factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);

}


