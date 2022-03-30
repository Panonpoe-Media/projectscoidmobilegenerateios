import 'package:flutter/widgets.dart';


class Validator extends FormField<String> {
  Validator({
    Key? key,
    this.value,

    FormFieldValidator<String?>? validator,


  }) :
        super(
        key: key,
        initialValue: value,
        validator: validator,

        builder: (FormFieldState<String> field) {
          return Text('');
        },
      );

  final String? value;
  @override
  _ValidatorState createState() => _ValidatorState();
}

class _ValidatorState extends FormFieldState<String> {


}