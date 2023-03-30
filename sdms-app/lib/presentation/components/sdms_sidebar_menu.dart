// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:sdms_app/data/repositories/session_repository.dart';
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/routes/home_locations.dart';
import 'package:sdms_app/presentation/routes/unauthenticated_locations.dart';
import 'package:sdms_app/presentation/size_config.dart';
import 'package:sdms_app/presentation/theme/sdms_text.dart';

class SidebarMenu extends StatelessWidget {
  final String userName;

  const SidebarMenu({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(250),
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: ConstColors.drawerHeader,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_circle_sharp,
                    color: ConstColors.iconBlack,
                    size: 120.0,
                  ),
                  const SizedBox(height: defaultPadding),
                  Expanded(
                    child: Text(
                      userName,
                      style: const SdmsText().primaryTitle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text("Home"),
            onTap: () {
              Beamer.of(context, root: true)
                  .beamToNamed(HomeLocations.homeRoute);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("All messages"),
            onTap: () {
              Beamer.of(context, root: true)
                  .beamToNamed(HomeLocations.messagesRoute);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("View recent visitors"),
            onTap: () {
              Beamer.of(context, root: true)
                  .beamToNamed(HomeLocations.visitorHistoryRoute);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("Customize my SDMS"),
            onTap: () {
              Beamer.of(context, root: true)
                  .beamToNamed(HomeLocations.customizeRoute);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("Settings"),
            onTap: () {
              Beamer.of(context, root: true)
                  .beamToNamed(HomeLocations.settingsRoute);
              Navigator.pop(context);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(defaultPadding)),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(15),
                horizontal: getProportionateScreenWidth(70),
              ),
              backgroundColor: ConstColors.buttonBackground,
            ),
            onPressed: () {
              context.read<SessionRepository>().logout();
              Beamer.of(context)
                  .beamToNamed(UnauthenticatedLocations.signInRoute);
            },
            child: Text(
              'Logout',
              style: const SdmsText().primarySemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
