


class OptionField{

  String?  description;
  String?  price;



  OptionField(
      this.description,
      this.price,
      );


  factory OptionField.fromJson(Map<String, dynamic> json) => _$OptionFieldFromJson(json);

  Map<String, dynamic> toJson() => _$OptionFieldToJson(this);

}

OptionField _$OptionFieldFromJson(Map<String, dynamic> json) {
  return OptionField(
      json['description'] as String, json['price'] as String);
}

Map<String, dynamic> _$OptionFieldToJson(OptionField instance) =>
    <String, dynamic>{
      'description': instance.description,
      'price': instance.price
    };

class OptionField1{

  String?  description;
  double?  price;



  OptionField1(
      this.description,
      this.price,
      );


  factory OptionField1.fromJson(Map<String, dynamic> json) => _$OptionField1FromJson(json);

  Map<String, dynamic> toJson() => _$OptionField1ToJson(this);

}
// (json['seller_completion_rate'] as num?)?.toDouble(),
OptionField1 _$OptionField1FromJson(Map<String, dynamic> json) {
  return OptionField1(
      json['description'] as String?,json['price'] == '' ||json['price'] == null ? 0.0 :  double.tryParse(json['price']) );
}

Map<String, dynamic> _$OptionField1ToJson(OptionField1 instance) =>
    <String, dynamic>{
      'description': instance.description,
      'price': instance.price
    };