import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget
{
  const CustomButton(
      {
        super.key,
        required this.fun,
        required this.title,
        this.click=true,
        this.textColor = Colors.white,
        this.padding,
        this.textSize = 15,
        this.radius = 12,
        this.titleWidget,
        this.backGroundColor = Colors.blue,
        this.borderSide,
        this.verticalPadding = 10,
        this.textStyle = const TextStyle()
      });

  final void Function() fun;
  final String title;
  final bool click;
  final Color? textColor,backGroundColor;
  final EdgeInsetsGeometry? padding;
  final double textSize;
  final double radius;
  final Widget? titleWidget;
  final BorderSide? borderSide;
  final double verticalPadding;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context)
  {
    return TextButton(
      style: TextButton.styleFrom( 
          padding: padding??EdgeInsets.symmetric(vertical: verticalPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side:borderSide?? BorderSide(color:click ? Colors.transparent:Colors.black26,width: 1.5),
          ),
          backgroundColor:click? backGroundColor:Colors.white
      ),
      onPressed: fun,
      child: titleWidget ?? Text(
        title, style: textStyle?.copyWith(
          color:click ? textColor! : Colors.black54,
          fontSize: textSize
      ),),
    );
  }
}
