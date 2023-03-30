// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:sdms_app/business/cubit/login_cubit.dart';
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/routes/unauthenticated_locations.dart';
import 'package:sdms_app/presentation/screens/sign_in/components/sign_in_form.dart';
import 'package:sdms_app/presentation/size_config.dart';
import 'package:sdms_app/presentation/theme/sdms_text.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<StatefulWidget> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  bool autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(35),
                  ),
                  Text(
                    "SDMS",
                    style: const SdmsText().title,
                  ),
                  Text(
                    "Door monitoring, made easy.",
                    style: const SdmsText().primaryRegular,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(35),
                  ),
                  BlocBuilder<LoginCubit, LoginState>(
                    buildWhen: (previous, current) =>
                        previous.status != current.status,
                    builder: (context, state) {
                      return SignInForm(
                        initialEmailValue: state.email,
                        initialPasswordValue: state.password,
                        formKey: _formKey,
                        autoValidate:
                            state.status == LoginFormStatus.submissionFailure
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
              SizedBox(
                height: getProportionateScreenHeight(defaultPadding),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(15),
                    horizontal: getProportionateScreenWidth(70),
                  ),
                  backgroundColor: ConstColors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(
                      color: ConstColors.darkBlue,
                    ),
                  ),
                  elevation: 8.0,
                ),
                onPressed: () {
                  if (!autoValidate) {
                    setState(() {
                      autoValidate = true;
                    });
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                  }
                  context.read<LoginCubit>().login();
                },
                child: Text(
                  'Login',
                  style: const SdmsText().primarySemiBold,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(defaultPadding),
              ),
              InkWell(
                child: Padding(
                  padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                  child: Text(
                    "Forgot password?",
                    style: const SdmsText().primaryRegular,
                    textAlign: TextAlign.right,
                  ),
                ),
                onTap: () {
                  Beamer.of(context, root: true)
                      .beamToNamed(UnauthenticatedLocations.forgotFormRoute);
                },
              ),
              InkWell(
                child: Padding(
                  padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                  child: Text(
                    "Create an account",
                    style: const SdmsText().primaryRegular,
                    textAlign: TextAlign.right,
                  ),
                ),
                onTap: () {
                  Beamer.of(context, root: true)
                      .beamToNamed(UnauthenticatedLocations.createAccountRoute);
                },
              ),
              const Spacer(),
            ],
          ),
        )
      ],
    );
  }
}
