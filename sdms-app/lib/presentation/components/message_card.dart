// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:sdms_app/globals.dart';
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/size_config.dart';
import 'package:sdms_app/presentation/theme/sdms_text.dart';

class MessageCard extends StatelessWidget {
  /// The maximum number of characters in the message preview that
  /// will be displayed on the home screen.
  final int maxChar = 70;

  /// The message's full body text, a portion of which
  /// will be displayed if it exceeds [maxChar] characters.
  final String message;

  /// The date and time, in milliseconds since epoch, that this message was
  /// received.
  final int receivedAt;

  const MessageCard({
    super.key,
    required this.message,
    required this.receivedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: ConstColors.mediumBlue,
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenHeight(10)),
        child: SizedBox(
          width: getProportionateScreenWidth(300),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(280),
                child: RichText(
                  text: TextSpan(
                    style: const SdmsText().primaryRegular,
                    children: [
                      TextSpan(
                        text: '${Globals.formatDateTime(receivedAt)} ',
                        style: const SdmsText().primaryItalicBold,
                      ),
                      TextSpan(
                        text: getPreview(message),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                  width: getProportionateScreenWidth(20),
                  child: const Icon(Icons.chevron_right)),
            ],
          ),
        ),
      ),
    );
  }

  /// Extracts a preview less than [maxChar] characters from [message], and
  /// appends ellipses at the end if [message] has been truncated.
  ///
  /// Otherwise, returns the original [message].
  String getPreview(String message) {
    String trimmedMessage = message.trim();
    trimmedMessage = trimmedMessage.replaceAll("\n", ".");

    return trimmedMessage.length > maxChar
        ? '${trimmedMessage.substring(0, maxChar)}...'
        : trimmedMessage;
  }
}
