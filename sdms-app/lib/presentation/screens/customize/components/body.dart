// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:form_builder_validators/form_builder_validators.dart';

// Project imports:
import 'package:sdms_app/presentation/components/greeting_option.dart';
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/size_config.dart';
import 'package:sdms_app/presentation/theme/sdms_text.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    var maxCharacters = 200;
    var options = [
      "Is anybody home?",
      "Your delivery has arrived!",
      "Are you available for a moment to praise our lord and saviour chatGPT?",
      "a",
      "a",
      "a",
    ];

    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.only(top: getProportionateScreenHeight(10)),
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(defaultPadding),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Change default greeting:",
                  style: const SdmsText().primarySemiBold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  """This is the message shown on your SDMS touchscreen """
                  """when a visitor arrives.""",
                  style: const SdmsText().primaryRegular,
                ),
              ),
              TextFormField(
                  maxLength: maxCharacters,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  autofocus: false,
                  maxLines: null,
                  minLines: 6,
                  enabled: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[350],
                    filled: true,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.all(defaultPadding),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.max(maxCharacters),
                  ]),
                  onChanged: (replyText) {
                    // TODO: update state
                    // context.read<MessageBloc>().add(
                    //       MessageUpdateReply(
                    //           replyText: replyText),
                    //     );
                  }),
              SizedBox(height: getProportionateScreenHeight(defaultPadding)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: ConstColors.buttonBackground,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {
                        print("touchscreen message updated");
                        // context
                        //     .read<MessageBloc>()
                        //     .add(const MessageSendReply());
                      },
                      color: ConstColors.iconBlack,
                      tooltip: "Send message",
                      icon: const Icon(Icons.send_rounded),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Change visitor's greeting options:",
                  style: const SdmsText().primarySemiBold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  """These are the 5 predefined messages that a visitor can """
                  """choose from on the touchscreen.""",
                  style: const SdmsText().primaryRegular,
                ),
              ),
              Container(
                height: getProportionateScreenHeight(350),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[400]!,
                      blurRadius: 4,
                      offset: const Offset(4, 8), // Shadow position
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: options.length,
                          itemBuilder: (context, index) {
                            return GreetingOption(
                              message: options[index],
                            );
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(defaultPadding),
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Add new greeting",
                          style: const SdmsText().primaryItalic,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Center(
                        child: IconButton(
                          onPressed: () {
                            // TODO
                            print("pressed");
                          },
                          icon: const Icon(Icons.add),
                          iconSize: getProportionateScreenWidth(30),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.grey,
                        offset: Offset(5.0, 5.0),
                      )
                    ],
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      elevation: 5.0,
                      textStyle: const SdmsText().primarySemiBold,
                      backgroundColor: ConstColors.replyButtonBackground,
                      foregroundColor: ConstColors.replyButtonText,
                    ),
                    onPressed: () {
                      // TODO
                      print("Save changes");
                    },
                    child: const Text('Save Changes'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
