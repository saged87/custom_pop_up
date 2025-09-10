import 'package:flutter/material.dart';
import 'components/custom_alert_dialog.dart';
import 'components/pop_up_content_widget.dart';

class CustomPopUp
{
  final List<Widget>? alertDialogActionButtons;
  final EdgeInsets alertDialogOuterPadding;
  final EdgeInsets alertDialogContentPadding;
  final bool alertDialogIsScrollable;
  final bool dismissible;

  final Widget? imageWidget;
  final Widget bodyWidget;
  final Widget? underButtonsWidget;
  final bool showCloseBtn;
  final bool showActionBtn;
  final bool showCloseIcon;
  final String actionBtnText;
  final String closeBtnText;
  final Color closeBtnColor;
  final EdgeInsets imageWidgetPadding;
  final EdgeInsets bodyWidgetPadding;
  final VoidCallback? actionBtnOnClick;
  final double buttonsBorderRadius;
  final Color closeBtnFontColor;
  final double buttonsGap;

  CustomPopUp({
    this.alertDialogActionButtons,
    this.alertDialogOuterPadding = const EdgeInsets.all(10),
    this.alertDialogContentPadding = const EdgeInsets.all(10),
    this.alertDialogIsScrollable = true,
    this.dismissible = true,
    required this.bodyWidget,
    this.imageWidget,
    this.underButtonsWidget,
    this.showActionBtn = false,
    this.showCloseBtn = false,
    this.showCloseIcon = false,
    this.actionBtnText = "",
    this.closeBtnText = "",
    this.closeBtnColor = const Color.fromARGB(255, 235, 235, 235),
    this.imageWidgetPadding = const EdgeInsets.all(10),
    this.bodyWidgetPadding = const EdgeInsets.all(10),
    this.actionBtnOnClick,
    this.buttonsBorderRadius = 12,
    this.closeBtnFontColor = const Color(0xff000000),
    this.buttonsGap = 25,

  });

  Widget _createPopUpContentWidget()
  {
    return PopUpContentWidget(
      actionBtnOnClick: actionBtnOnClick,
      actionBtnText: actionBtnText,
      bodyWidget: bodyWidget,
      bodyWidgetPadding: bodyWidgetPadding,
      buttonsBorderRadius: buttonsBorderRadius,
      buttonsGap: buttonsGap,
      closeBtnColor: closeBtnColor,
      closeBtnFontColor: closeBtnFontColor,
      closeBtnText: closeBtnText,
      imageWidget: imageWidget,
      imageWidgetPadding: imageWidgetPadding,
      showActionBtn: showActionBtn,
      showCloseBtn: showCloseBtn,
      showCloseIcon: showCloseIcon,
      underButtonsWidget: underButtonsWidget,
    );
  }

  Widget _createCustomAlertDialog()
  {
    return CustomAlertDialog(
      _createPopUpContentWidget(),
      actionButtons: alertDialogActionButtons,
      contentPadding: alertDialogContentPadding,
      outerPadding: alertDialogOuterPadding,
      scrollable: alertDialogIsScrollable,
    );
  }

  show(BuildContext context)
  {
    showDialog(
        barrierDismissible: dismissible,
        context: context,
        builder: (_)
        {
          if(dismissible)
          {
            return _createCustomAlertDialog();
          }
          else
          {
            return PopScope(
                canPop: false, // if false → prevents pop
                child: _createCustomAlertDialog()
            );
          }
        }
    );
  }
}