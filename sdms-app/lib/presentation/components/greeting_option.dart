// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:sdms_app/presentation/size_config.dart';
import 'package:sdms_app/presentation/theme/sdms_text.dart';

class GreetingOption extends StatelessWidget {
  final String message;

  const GreetingOption({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  message,
                  style: const SdmsText().primaryRegular,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Center(
              child: IconButton(
                onPressed: () {
                  // TODO
                  print("pressed");
                },
                icon: const Icon(Icons.delete_forever_outlined),
                iconSize: getProportionateScreenWidth(30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
