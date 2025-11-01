import 'package:flutter/material.dart';

import 'custom_button.dart';


class PopUpContentWidget extends StatelessWidget {
  final Widget? imageWidget;
  final Widget? bodyWidget;
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
  final Color? backGroundColor;

  const PopUpContentWidget({
    super.key,
    this.imageWidget,
    this.bodyWidget,
    this.underButtonsWidget,
    this.showActionBtn = true,
    this.showCloseBtn = true,
    this.showCloseIcon = true,
    this.actionBtnText = "",
    this.closeBtnText = "",
    this.closeBtnColor = const Color.fromARGB(255, 246, 213, 26),
    this.imageWidgetPadding = const EdgeInsets.all(10),
    this.bodyWidgetPadding = const EdgeInsets.all(10),
    this.actionBtnOnClick,
    this.buttonsBorderRadius = 12,
    this.closeBtnFontColor = const Color(0xff000000),
    this.buttonsGap = 25,
    this.backGroundColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backGroundColor ?? Theme.of(context).colorScheme.secondary,
      constraints: BoxConstraints(
        maxWidth: 500
      ),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          showCloseIcon ?
          GestureDetector(
              onTap: ()
              {
                Navigator.of(context).pop();
              },
              child: const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.close, color: Colors.grey, size: 30,)
              )
          ) : const SizedBox(),
          if(imageWidget != null)
            Container(
              padding: imageWidgetPadding,
              child: imageWidget,
            ),
          Container(
            padding: bodyWidgetPadding,
            child: bodyWidget,
          ),
          Row(
            children: [
              showActionBtn ?
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: CustomButton(
                    verticalPadding: 15,
                    radius: buttonsBorderRadius,
                    fun: ()
                    {
                      if(actionBtnOnClick != null) actionBtnOnClick!();
                    }, title: actionBtnText,

                  ),

                ),
              ) :
              Container(),

              showActionBtn && showCloseBtn ?
              SizedBox(width: buttonsGap) :
              Container(),

              showCloseBtn ?
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: CustomButton(
                    verticalPadding: 15,
                    textColor: closeBtnFontColor,
                    radius: buttonsBorderRadius,
                    backGroundColor: closeBtnColor,
                    fun: ()
                    {
                      Navigator.of(context).pop();
                    },
                    title: closeBtnText,
                  ),
                ),
              ) : Container(),
            ],
          ),
          underButtonsWidget != null ? underButtonsWidget! : Container(),
        ],
      ),
    );
  }
}