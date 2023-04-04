// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// Project imports:
import 'package:sdms_app/business/cubit/create_account_cubit.dart';
import 'package:sdms_app/data/models/user.dart';
import 'package:sdms_app/presentation/components/form_error.dart';
import 'package:sdms_app/presentation/components/loading.dart';
import 'package:sdms_app/presentation/size_config.dart';

class CreateAccountForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final String? initialSdmsIdValue;
  final String? initialNameValue;
  final String? initialEmailValue;
  final String? initialPasswordValue;
  final String? initialConfirmPasswordValue;
  final bool autoValidate;
  final bool disabled;

  const CreateAccountForm({
    super.key,
    required this.formKey,
    required this.autoValidate,
    this.disabled = false,
    this.initialSdmsIdValue,
    this.initialNameValue,
    this.initialEmailValue,
    this.initialPasswordValue,
    this.initialConfirmPasswordValue,
  });

  @override
  State<CreateAccountForm> createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  /// true if the form should validate on value change, false for onSubmit.
  ///
  /// Disables auto validation until they hit submit. Don't bother the user with
  /// errors before they've had a chance to fill out the form.
  bool autoValidate = false;

  @override
  Widget build(BuildContext context) {
    String? errorMessage =
        context.select((CreateAccountCubit bloc) => bloc.state.errorMessage);

    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFormField(
            enabled: !widget.disabled,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "SDMS Id",
            ),
            initialValue: widget.initialSdmsIdValue,
            autovalidateMode:
                widget.autoValidate ? AutovalidateMode.onUserInteraction : null,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.numeric(),
            ]),
            onChanged: (sdmsId) =>
                context.read<CreateAccountCubit>().sdmsIdChanged(sdmsId),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          TextFormField(
            enabled: !widget.disabled,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
            initialValue: widget.initialNameValue,
            autovalidateMode:
                widget.autoValidate ? AutovalidateMode.onUserInteraction : null,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
            onChanged: (name) =>
                context.read<CreateAccountCubit>().nameChanged(name),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
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
                context.read<CreateAccountCubit>().emailChanged(email),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          TextFormField(
            enabled: !widget.disabled,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
            initialValue: widget.initialPasswordValue,
            autovalidateMode:
                widget.autoValidate ? AutovalidateMode.onUserInteraction : null,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.minLength(User.minimumPasswordLength),
            ]),
            onChanged: (password) =>
                context.read<CreateAccountCubit>().passwordChanged(password),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          TextFormField(
            enabled: !widget.disabled,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Confirm Password',
            ),
            initialValue: widget.initialPasswordValue,
            autovalidateMode:
                widget.autoValidate ? AutovalidateMode.onUserInteraction : null,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.minLength(User.minimumPasswordLength),
            ]),
            onChanged: (password) => context
                .read<CreateAccountCubit>()
                .confirmPasswordChanged(password),
          ),
          SizedBox(height: getProportionateScreenHeight(35)),
          BlocBuilder<CreateAccountCubit, CreateAccountState>(
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
