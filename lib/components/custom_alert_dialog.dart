import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget
{
  final Widget dialogContent;
  final List<Widget>? actionButtons;
  final EdgeInsets outerPadding;
  final EdgeInsets contentPadding;
  final bool scrollable;

  const CustomAlertDialog(this.dialogContent,
  {
    super.key,
    this.actionButtons,
    this.outerPadding = const EdgeInsets.all(20),
    this.contentPadding = const EdgeInsets.all(20),
    this.scrollable = true,
  });

  @override
  Widget build(BuildContext context)
  {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      insetPadding: outerPadding,
      contentPadding: contentPadding,
      content: dialogContent,
      actions: actionButtons,
      scrollable: scrollable,
    );
  }
}