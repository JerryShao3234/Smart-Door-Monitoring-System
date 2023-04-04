// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// Project imports:
import 'package:sdms_app/business/cubit/login_cubit.dart';
import 'package:sdms_app/presentation/components/form_error.dart';
import 'package:sdms_app/presentation/components/loading.dart';

class ForgotPasswordForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final String? initialEmailValue;
  final bool autoValidate;
  final bool disabled;

  const ForgotPasswordForm({
    super.key,
    required this.formKey,
    required this.autoValidate,
    this.disabled = false,
    this.initialEmailValue,
  });

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  @override
  Widget build(BuildContext context) {
    String? errorMessage =
        context.select((LoginCubit bloc) => bloc.state.errorMessage);

    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            enabled: !widget.disabled,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
            initialValue: widget.initialEmailValue,
            autovalidateMode:
                widget.autoValidate ? AutovalidateMode.onUserInteraction : null,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ]),
            onChanged: (email) =>
                context.read<LoginCubit>().emailChanged(email),
          ),
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
