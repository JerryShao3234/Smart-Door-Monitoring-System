// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:sdms_app/business/cubit/create_account_cubit.dart';
import 'package:sdms_app/business/cubit/login_cubit.dart';
import 'package:sdms_app/business/cubit/session_cubit.dart';
import 'package:sdms_app/data/repositories/session_repository.dart';
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/routes/unauthenticated_locations.dart';
import 'package:sdms_app/presentation/screens/forgot_password/components/forgot_password_view.dart';
import 'package:sdms_app/presentation/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(defaultPadding),
        ),
        child: BlocProvider(
          create: (context) => LoginCubit(
            sessionRepository: context.read<SessionRepository>(),
          ),
          child: BlocListener<SessionCubit, SessionState>(
            listenWhen: (previous, current) =>
                previous.session.runtimeType != current.session.runtimeType,
            listener: (context, state) {
              if (state.session.isAuthenticated) {
                Future.delayed(const Duration(seconds: 5));

                Beamer.of(context)
                    .beamToNamed(UnauthenticatedLocations.signInRoute);
              }

              if (!context.read<CreateAccountCubit>().isClosed) {
                context.read<CreateAccountCubit>().resetStatus();
              }
            },
            child: const ForgotPasswordView(),
          ),
        ),
      ),
    );
  }
}
