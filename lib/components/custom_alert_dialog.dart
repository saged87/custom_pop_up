import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget
{
  final Widget dialogContent;
  final List<Widget>? actionButtons;
  final EdgeInsets outerPadding;
  final EdgeInsets contentPadding;
  final bool scrollable;
  final Color? backGroundColor;

  const CustomAlertDialog(this.dialogContent,
  {
    super.key,
    this.actionButtons,
    this.outerPadding = const EdgeInsets.all(20),
    this.contentPadding = const EdgeInsets.all(20),
    this.scrollable = true,
    this.backGroundColor
  });

  @override
  Widget build(BuildContext context)
  {
    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: backGroundColor ?? Theme.of(context).colorScheme.secondary,
      insetPadding: outerPadding,
      contentPadding: contentPadding,
      content: dialogContent,
      actions: actionButtons,
      scrollable: scrollable,
    );
  }
}