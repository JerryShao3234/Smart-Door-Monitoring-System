// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:sdms_app/business/bloc/message_bloc.dart';
import 'package:sdms_app/business/cubit/login_cubit.dart';
import 'package:sdms_app/business/cubit/session_cubit.dart';
import 'package:sdms_app/data/repositories/session_repository.dart';
import 'package:sdms_app/presentation/components/loading.dart';
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/routes/home_locations.dart';
import 'package:sdms_app/presentation/screens/sign_in/components/sign_in_view.dart';
import 'package:sdms_app/presentation/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.only(top: getProportionateScreenHeight(10)),
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
                  context.read<MessageBloc>().add(const MessageGetAll());
                  Beamer.of(context, root: true)
                      .beamToNamed(HomeLocations.homeRoute);
                }

                if (!context.read<LoginCubit>().isClosed) {
                  context.read<LoginCubit>().resetStatus();
                }
              },
              child: BlocBuilder<LoginCubit, LoginState>(
                buildWhen: (previous, current) =>
                    previous.isDisabled != current.isDisabled,
                builder: (context, state) {
                  if (state.isDisabled) {
                    return const Loading();
                  } else {
                    return const SignInView();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
