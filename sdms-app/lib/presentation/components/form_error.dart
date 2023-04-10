// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/size_config.dart';
import 'package:sdms_app/presentation/theme/sdms_text.dart';

/// A light red box with a red warning sign and red warning text.
///
/// Returns a 0x0 [SizedBox] if text is null or empty, under the assumption that
/// there is no error.
class FormError extends StatelessWidget {
  const FormError({
    super.key,
    this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    if (text == null || text!.trim().isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      decoration: BoxDecoration(
          color: ConstColors.darkBlue.withOpacity(1),
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      child: Row(
        children: [
          const Icon(
            Icons.warning,
            color: ConstColors.red,
          ),
          SizedBox(width: getProportionateScreenWidth(10)),
          Expanded(
            child: Text(
              text!,
              style: Theme.of(context)
                  .extension<SdmsText>()!
                  .caption1SemiBold
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
