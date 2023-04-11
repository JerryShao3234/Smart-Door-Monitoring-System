// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:sdms_app/business/cubit/create_account_cubit.dart';
import 'package:sdms_app/presentation/components/modal.dart';
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/screens/create_account/components/create_account_form.dart';
import 'package:sdms_app/presentation/size_config.dart';
import 'package:sdms_app/presentation/theme/sdms_text.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<StatefulWidget> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final _formKey = GlobalKey<FormState>();
  bool autoValidate = false;

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
                  Text(
                    "Create an Account",
                    style: const SdmsText().title2,
                  ),
                  Text(
                    " Fill in the fields below to get started.",
                    style: const SdmsText().primaryRegular,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(35),
                  ),
                  BlocBuilder<CreateAccountCubit, CreateAccountState>(
                    buildWhen: (previous, current) =>
                        previous.status != current.status,
                    builder: (context, state) {
                      return CreateAccountForm(
                        initialNameValue: state.name,
                        initialEmailValue: state.email,
                        initialPasswordValue: state.password,
                        initialSdmsIdValue: state.sdmsId,
                        formKey: _formKey,
                        autoValidate: state.status ==
                                CreateAccountFormStatus.submissionFailure
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
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(15),
                    horizontal: getProportionateScreenWidth(70),
                  ),
                  backgroundColor: ConstColors.buttonBackground,
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
                  context.read<CreateAccountCubit>().signup();
                },
                child: Text(
                  'Submit',
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
                    "Where do I find my SDMS id?",
                    style: const SdmsText().primaryRegular,
                    textAlign: TextAlign.right,
                  ),
                ),
                onTap: () {
                  Modal(
                    context: context,
                    title: "Where do I find my SDMS id?",
                    message: "When your SDMS connects to the Internet for the "
                        "first time, it will display your unique ID on the "
                        "touchscreen.\n"
                        "That is the ID you should enter here.",
                    buttonText: "Got it",
                  ).show();
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
