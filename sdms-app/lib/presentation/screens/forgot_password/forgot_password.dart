// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:sdms_app/presentation/screens/forgot_password/components/body.dart';
import 'package:sdms_app/presentation/size_config.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return const Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
