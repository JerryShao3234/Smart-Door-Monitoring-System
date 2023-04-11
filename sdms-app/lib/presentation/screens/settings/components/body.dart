// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// Project imports:
import 'package:sdms_app/business/bloc/message_bloc.dart';
import 'package:sdms_app/data/models/user.dart';
import 'package:sdms_app/presentation/components/modal.dart';
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/routes/home_locations.dart';
import 'package:sdms_app/presentation/size_config.dart';
import 'package:sdms_app/presentation/theme/sdms_text.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ConstColors.lightBlue,
              ConstColors.mediumBlue,
            ]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(defaultPadding),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                        getProportionateScreenHeight(defaultPadding)),
                    child: Text(
                      "Use this device as the SDMS Camera:",
                      style: const SdmsText().primarySemiBold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocBuilder<MessageBloc, MessageState>(
                        buildWhen: (previous, current) =>
                            previous.error != current.error,
                        builder: (context, state) {
                          return Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: ConstColors.darkBlue, width: 1.5),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  elevation: 5.0,
                                  textStyle: const SdmsText().primarySemiBold,
                                  backgroundColor: ConstColors.yellow,
                                  foregroundColor: ConstColors.darkBlue,
                                  padding: const EdgeInsets.all(defaultPadding),
                                ),
                                onPressed: () {
                                  Modal(
                                    context: context,
                                    title:
                                        "Enable Camera mode for SDMS with ID = ${state.user.sdmsId}?",
                                    icon: Icon(
                                      Icons.camera_alt_rounded,
                                      size: getProportionateScreenHeight(50),
                                    ),
                                    iconBackgroundColor: ConstColors.darkBlue,
                                    message:
                                        "This device will be used as the camera "
                                        "and should not be removed after being "
                                        "mounted on the SDMS. "
                                        "Please confirm whether you wish to continue.",
                                    buttonText: "Continue",
                                    onButtonPressed: () {
                                      Beamer.of(context).popBeamLocation();
                                      Beamer.of(context, root: true)
                                          .beamToNamed(
                                              HomeLocations.cameraRoute);
                                    },
                                    secondaryButtonText: "Cancel",
                                    showCloseButton: true,
                                  ).show();
                                },
                                child: const Text('Enable SDMS Camera mode'),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                        getProportionateScreenHeight(defaultPadding)),
                    child: Text(
                      "Change Password:",
                      style: const SdmsText().primarySemiBold,
                    ),
                  ),
                  TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'New password',
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(
                            User.minimumPasswordLength),
                      ]),
                      onChanged: (password) => print(password)),
                  SizedBox(
                      height: getProportionateScreenHeight(defaultPadding)),
                  TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm new password',
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(
                            User.minimumPasswordLength),
                      ]),
                      onChanged: (password) => print(password)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: ConstColors.darkBlue, width: 1.5),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              elevation: 5.0,
                              textStyle: const SdmsText().primarySemiBold,
                              backgroundColor: ConstColors.yellow,
                              foregroundColor: ConstColors.darkBlue,
                              padding: const EdgeInsets.all(15),
                            ),
                            onPressed: () {
                              print("change password");
                            },
                            child: const Text('Change Password'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: getProportionateScreenHeight(defaultPadding)),
                  Padding(
                    padding: EdgeInsets.all(
                        getProportionateScreenHeight(defaultPadding)),
                    child: Text(
                      "Clear all visitor history:",
                      style: const SdmsText().primarySemiBold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                        getProportionateScreenHeight(defaultPadding)),
                    child: RichText(
                      text: TextSpan(
                        text: "Note: this action ",
                        style: const SdmsText().primaryRegularRed,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'cannot ',
                            style: const SdmsText().primarySemiBoldRed,
                          ),
                          TextSpan(
                            text: 'be undone.',
                            style: const SdmsText().primaryRegularRed,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: ConstColors.darkBlue, width: 1.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              elevation: 5.0,
                              textStyle: const SdmsText().primarySemiBold,
                              backgroundColor: ConstColors.red,
                              foregroundColor: ConstColors.replyButtonText,
                              padding: const EdgeInsets.all(15),
                            ),
                            onPressed: () {
                              print("delete visitor history");
                            },
                            child: const Text('Delete history'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: getProportionateScreenHeight(defaultPadding)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
