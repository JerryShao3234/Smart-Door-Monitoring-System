// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';

// Project imports:
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/size_config.dart';

class NavigateButton extends StatelessWidget {
  /// The icon to display in the button
  final IconData icon;

  /// The tooltip to display when user hovers over button
  final String tooltip;

  /// The path of the screen to take the user to after pressing the button
  final String destination;

  const NavigateButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        Beamer.of(context, root: true).beamToNamed(destination);
      },
      elevation: 3.0,
      fillColor: ConstColors.yellow,
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      shape: const CircleBorder(),
      child: Icon(
        icon,
        size: 55.0,
        color: ConstColors.darkBlue,
      ),
    );
  }
}
