// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/size_config.dart';
import 'package:sdms_app/presentation/theme/sdms_text.dart';

class Loading extends StatelessWidget {
  final String? text;
  const Loading({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Text(
            text ?? "Loading...",
            style: Theme.of(context)
                .extension<SdmsText>()!
                .primaryRegular
                .copyWith(color: ConstColors.text),
          ),
        ],
      ),
    );
  }
}
