// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/size_config.dart';

class SDMSAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The title to be displayed on the app bar
  final String appBarTitle;

  /// The function to execute when the left icon is pressed
  final void Function() callback;

  const SDMSAppBar({
    super.key,
    required this.appBarTitle,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appBarTitle,
        selectionColor: ConstColors.appBarText,
      ),
      backgroundColor: ConstColors.darkBlue,
      elevation: 0,
      leading: IconButton(
        onPressed: callback,
        icon: const Icon(Icons.menu),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(getProportionateScreenHeight(60));
}
