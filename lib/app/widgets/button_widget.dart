import 'package:flutter/material.dart';
import 'package:flutter_base_project/theme/colors.dart';

typedef onPressButton = void Function();

class ButtonWidget extends StatelessWidget {
  ButtonWidget(
      {Key? key,
      this.color,
      this.padding,
      this.radius,
      this.child,
      this.onPress,
      this.text,
      this.textStyle,
      this.loading, this.side})
      : super(key: key);
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final Widget? child;
  final onPressButton? onPress;
  final String? text;
  final TextStyle? textStyle;
  final bool? loading;
  final BorderSide? side;

  Widget renderChild() {
    if (this.loading != null && this.loading!) {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColor.grey),
          strokeWidth: 3,
        ),
      );
    }
    return child != null
        ? child!
        : Text(
            this.text!,
            style: TextStyle(color: Colors.black).merge(this.textStyle),
          );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: this.color,
      padding: padding == null
          ? EdgeInsets.symmetric(vertical: 15, horizontal: 15)
          : padding,
      shape: new RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius != null ? radius! : 6),
          side: side != null ? side! : BorderSide.none),
      child: renderChild(),
      onPressed: onPress,
    );
  }
}
