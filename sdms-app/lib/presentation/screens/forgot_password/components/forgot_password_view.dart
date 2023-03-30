// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:sdms_app/business/cubit/login_cubit.dart';
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/screens/forgot_password/components/forgot_password_form.dart';
import 'package:sdms_app/presentation/screens/forgot_password/components/new_password_form.dart';
import 'package:sdms_app/presentation/size_config.dart';
import 'package:sdms_app/presentation/theme/sdms_text.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<StatefulWidget> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  bool autoValidate = false;
  bool resetEmailSent = false;
  bool chooseNewPassword = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(35),
                  ),
                  Row(
                    children: [
                      Text(
                        "Reset your password",
                        style: const SdmsText().title3,
                      ),
                    ],
                  ),
                  resetEmailSent
                      ? Column(
                          children: [
                            SizedBox(height: getProportionateScreenHeight(70)),
                            Container(
                              height: getProportionateScreenHeight(120),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/thumbs-up.png"),
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: getProportionateScreenHeight(35),
                            ),
                            chooseNewPassword
                                ? Text(
                                    "Choose new password:",
                                    style: const SdmsText().primaryTitle,
                                  )
                                : Text(
                                    "Enter the email associated with your account below. "
                                    "We'll send you a link to change your password.",
                                    style: const SdmsText().primaryRegular,
                                  ),
                          ],
                        ),
                  SizedBox(
                    height: getProportionateScreenHeight(35),
                  ),
                  BlocBuilder<LoginCubit, LoginState>(
                    buildWhen: (previous, current) =>
                        previous.status != current.status,
                    builder: (context, state) {
                      if (resetEmailSent) {
                        return const SizedBox.shrink();
                      } else if (chooseNewPassword) {
                        return NewPasswordForm(
                          formKey: _formKey,
                          autoValidate: autoValidate,
                          disabled: state.isDisabled,
                        );
                      }

                      return ForgotPasswordForm(
                        initialEmailValue: state.email,
                        formKey: _formKey,
                        autoValidate: state.status ==
                                // TODO: change to forgot password
                                LoginFormStatus.submissionFailure
                            ? true
                            : autoValidate,
                        disabled: state.isDisabled,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(35)),
              resetEmailSent
                  ? Text(
                      "Eamil sent successfully!",
                      style: const SdmsText().primaryRegular,
                    )
                  : TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(15),
                          horizontal: getProportionateScreenWidth(70),
                        ),
                        backgroundColor: ConstColors.buttonBackground,
                      ),
                      onPressed: () {
                        print("forgot password");
                        setState(() {
                          chooseNewPassword = !chooseNewPassword;
                        });
                      },
                      child: Text(
                        chooseNewPassword ? 'Change Password' : 'Submit',
                        style: const SdmsText().primarySemiBold,
                      ),
                    ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
