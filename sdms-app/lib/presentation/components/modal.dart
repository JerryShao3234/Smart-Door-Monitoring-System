// Flutter imports:
import 'package:flutter/material.dart' hide CloseButton;

// Project imports:
import 'package:sdms_app/presentation/components/close_button.dart';
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/size_config.dart';
import 'package:sdms_app/presentation/theme/sdms_text.dart';

class Modal {
  /// The [BuildContext] on which you show the modal
  final BuildContext context;

  /// The [IconData] shown at the top of the modal in a circle
  ///
  /// You can only use one of [icon] or [iconData].
  final IconData? iconData;

  /// The color for the [iconData]. Defaults to ConstColors.iconBlack
  final Color iconColor;

  /// The color for the circle behind the [iconData].
  ///
  /// Defaults to ConstColors.buttonBackground
  final Color iconBackgroundColor;

  /// An alternate widget to set instead of the [iconData].
  ///
  /// You can only use one of [icon] or [iconData].
  final Widget? icon;

  final String title;
  final String message;
  final String buttonText;
  final bool showCloseButton;
  final String? secondaryButtonText;
  final Color? secondaryButtonBackgroundColor;
  final Color? secondaryButtonTextColor;
  final bool? secondaryButtonElevated;
  final Function()? onButtonPressed;
  final Function()? onClosePressed;
  final Function()? onSecondaryButtonPressed;

  Modal({
    required this.context,
    this.iconData,
    this.iconColor = ConstColors.iconBlack,
    this.iconBackgroundColor = ConstColors.buttonBackground,
    this.icon,
    required this.title,
    required this.message,
    required this.buttonText,
    this.showCloseButton = true,
    this.secondaryButtonText,
    this.secondaryButtonBackgroundColor,
    this.secondaryButtonTextColor,
    this.secondaryButtonElevated = true,
    this.onButtonPressed,
    this.onClosePressed,
    this.onSecondaryButtonPressed,
  }) : assert(iconData == null || icon == null,
            "One of iconData or icon must be null");

  Future<T?> show<T>() {
    return showDialog<T>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(defaultPadding),
            vertical: getProportionateScreenHeight(defaultPadding),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(5),
              right: getProportionateScreenWidth(5),
              bottom: getProportionateScreenHeight(30),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    showCloseButton
                        ? CloseButton(
                            backgroundColor: ConstColors.buttonBackground,
                            iconColor: ConstColors.iconGrey,
                            onPressed: () => onClosePressed != null
                                ? onClosePressed!()
                                : Navigator.pop(context),
                          )
                        : SizedBox(height: getProportionateScreenHeight(40)),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(defaultPadding),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      iconData == null
                          ? icon ?? const SizedBox.shrink()
                          : Container(
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundColor: iconBackgroundColor,
                                child: Icon(
                                  iconData,
                                  color: iconColor,
                                  size: 60,
                                ),
                              ),
                            ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .extension<SdmsText>()!
                            .primaryTitle,
                      ),
                      SizedBox(height: getProportionateScreenHeight(8)),
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .extension<SdmsText>()!
                            .primaryRegular,
                      ),
                      SizedBox(height: getProportionateScreenHeight(40)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(25),
                        ),
                        child: Column(
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: getProportionateScreenHeight(15),
                                  horizontal: getProportionateScreenWidth(70),
                                ),
                                backgroundColor: ConstColors.mediumBlue,
                              ),
                              onPressed: () => onButtonPressed != null
                                  ? onButtonPressed!()
                                  : Navigator.pop(context),
                              child: Text(
                                buttonText,
                                style: const SdmsText().primarySemiBold,
                              ),
                            ),
                            if (secondaryButtonText != null) ...[
                              SizedBox(
                                  height: secondaryButtonElevated!
                                      ? getProportionateScreenHeight(12)
                                      : getProportionateScreenHeight(4)),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    vertical: getProportionateScreenHeight(15),
                                    horizontal: getProportionateScreenWidth(70),
                                  ),
                                  backgroundColor: ConstColors.buttonBackground,
                                ),
                                onPressed: () =>
                                    onSecondaryButtonPressed != null
                                        ? onSecondaryButtonPressed!()
                                        : Navigator.pop(context),
                                child: Text(
                                  secondaryButtonText!,
                                  style: const SdmsText().primarySemiBold,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
