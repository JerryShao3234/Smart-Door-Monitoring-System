// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:sdms_app/globals.dart';
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/size_config.dart';
import 'package:sdms_app/presentation/theme/sdms_text.dart';

// ignore: must_be_immutable
class VisitorPreview extends StatelessWidget {
  final String dateAndTime;
  final List<Map<String, String>> messages;
  final String imageData;

  VisitorPreview({
    super.key,
    required this.dateAndTime,
    required this.messages,
    required this.imageData,
  });

  late MemoryImage image = Globals.imageFromBase64String(imageData);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenHeight(5)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: ConstColors.grey50,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 4,
              offset: const Offset(4, 8), // Shadow position
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  margin: EdgeInsets.all(getProportionateScreenWidth(15)),
                  height: getProportionateScreenHeight(500),
                  width: getProportionateScreenWidth(300),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image(
                      image: image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: defaultPadding,
                ),
                child: Text(
                  dateAndTime,
                  style: const SdmsText().primaryTitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: defaultPadding,
                  left: defaultPadding,
                  right: defaultPadding,
                ),
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) => RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: messages[index]["from"] == "visitor"
                              ? "Visitor: "
                              : "You: ",
                          style: const SdmsText().primarySemiBold,
                        ),
                        TextSpan(
                          text: messages[index]["text"]!,
                          style: const SdmsText().primaryRegular,
                        ),
                      ],
                    ),
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
