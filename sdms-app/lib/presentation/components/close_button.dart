// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/size_config.dart';

class CloseButton extends StatelessWidget {
  final Color? iconColor;
  final Color? backgroundColor;

  /// What action to take when the close button is pressed.
  ///
  /// By default, it pops the route of the highest level instance of Navigator
  /// in the Widget tree that can pop.
  ///
  /// This behavior is identical to the [BackButton].
  final Function()? onPressed;

  const CloseButton({
    super.key,
    this.iconColor,
    this.backgroundColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(56),
      height: getProportionateScreenHeight(56),
      child: IconButton(
        alignment: Alignment.centerRight,
        icon: CircleAvatar(
          backgroundColor: backgroundColor ?? Colors.white,
          child: Icon(
            Icons.close,
            color: iconColor ?? ConstColors.iconGrey,
            size: 23,
          ),
        ),
        onPressed: onPressed ??
            () {
              // Per the Beamer documentation, for Navigating back (popping),
              // use Navigator's pop method instead of Beamer.
              if (Navigator.of(context, rootNavigator: false).canPop()) {
                Navigator.of(context, rootNavigator: false).pop();
              } else if (Navigator.of(context, rootNavigator: true).canPop()) {
                Navigator.of(context, rootNavigator: true).pop();
              }
            },
      ),
    );
  }
}
