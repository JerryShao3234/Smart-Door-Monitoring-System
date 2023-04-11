// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// Project imports:
import 'package:sdms_app/business/cubit/login_cubit.dart';
import 'package:sdms_app/data/models/user.dart';
import 'package:sdms_app/presentation/components/form_error.dart';
import 'package:sdms_app/presentation/components/loading.dart';
import 'package:sdms_app/presentation/size_config.dart';

class SignInForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String? initialEmailValue;
  final String? initialPasswordValue;
  final bool autoValidate;
  final bool disabled;

  const SignInForm({
    super.key,
    this.initialEmailValue,
    this.initialPasswordValue,
    required this.formKey,
    required this.autoValidate,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    String? errorMessage =
        context.select((LoginCubit bloc) => bloc.state.errorMessage);

    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            enabled: !disabled,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
            initialValue: initialEmailValue,
            autovalidateMode:
                autoValidate ? AutovalidateMode.onUserInteraction : null,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ]),
            onChanged: (email) =>
                context.read<LoginCubit>().emailChanged(email),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          TextFormField(
            enabled: !disabled,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
            initialValue: initialPasswordValue,
            autovalidateMode:
                autoValidate ? AutovalidateMode.onUserInteraction : null,
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(User.minimumPasswordLength),
              ],
            ),
            onChanged: (password) =>
                context.read<LoginCubit>().passwordChanged(password),
          ),
          SizedBox(height: getProportionateScreenHeight(35)),
          BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) {
              return previous.errorMessage != current.errorMessage ||
                  previous.isDisabled != current.isDisabled;
            },
            builder: (context, state) {
              if (state.isDisabled) {
                return const Loading();
              } else if (state.errorMessage != null) {
                return Column(
                  children: [
                    FormError(text: errorMessage),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
