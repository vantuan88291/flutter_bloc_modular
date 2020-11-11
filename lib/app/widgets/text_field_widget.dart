import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/material.dart';

typedef onChangeText = void Function(String);
typedef onValidateText = void Function(String);

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({Key key, this.hint, this.onChange, this.keyBoard, this.password, this.autovalidate, this.onValidate, this.style, this.value, this.inputBorder}) : super(key: key);
  final String hint;
  final onChangeText onChange;
  final onValidateText onValidate;
  final TextInputType keyBoard;
  final bool password;
  final bool autovalidate;
  final TextStyle style;
  final String value;
  final InputBorder inputBorder;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: AppColor.text).merge(style);
    return TextFormField(
      initialValue: value,
      style: textStyle,
      decoration: InputDecoration(
        hintText: this.hint,
        border: inputBorder ?? UnderlineInputBorder()
      ),
      onChanged: this.onChange,
      keyboardType: this.keyBoard,
      autovalidate: autovalidate != null ? autovalidate : false,
      obscureText: this.password == null ? false : this.password,
      validator: onValidate,
    );
  }
}
