// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/screens/create_account/components/body.dart';
import 'package:sdms_app/presentation/size_config.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Create account",
          selectionColor: ConstColors.appBarText,
        ),
        backgroundColor: ConstColors.appBarBg,
        elevation: 0,
      ),
      body: const Body(),
    );
  }
}
