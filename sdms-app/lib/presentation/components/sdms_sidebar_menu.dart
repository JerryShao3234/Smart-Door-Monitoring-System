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
                color: ConstColors.mediumBlue,
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
            leading: const Icon(Icons.home),
            onTap: () {
              Beamer.of(context, root: true)
                  .beamToNamed(HomeLocations.homeRoute);
              Navigator.pop(context);
            },
            tileColor: ConstColors.darkBlue.withOpacity(0.1),
          ),
          ListTile(
            title: const Text("All messages"),
            leading: const Icon(Icons.message_rounded),
            onTap: () {
              Beamer.of(context, root: true)
                  .beamToNamed(HomeLocations.messagesRoute);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("View recent visitors"),
            leading: const Icon(Icons.history),
            onTap: () {
              Beamer.of(context, root: true)
                  .beamToNamed(HomeLocations.visitorHistoryRoute);
              Navigator.pop(context);
            },
            tileColor: ConstColors.darkBlue.withOpacity(0.1),
          ),
          ListTile(
            title: const Text("Customize my SDMS"),
            leading: const Icon(Icons.edit),
            onTap: () {
              Beamer.of(context, root: true)
                  .beamToNamed(HomeLocations.customizeRoute);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("Settings"),
            leading: const Icon(Icons.settings),
            onTap: () {
              Beamer.of(context, root: true)
                  .beamToNamed(HomeLocations.settingsRoute);
              Navigator.pop(context);
            },
            tileColor: ConstColors.darkBlue.withOpacity(0.1),
          ),
          SizedBox(height: getProportionateScreenHeight(70)),
          SizedBox(
            width: getProportionateScreenWidth(10),
            height: getProportionateScreenHeight(100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(defaultPadding),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ConstColors.darkBlue,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(15),
                        horizontal: getProportionateScreenWidth(70),
                      ),
                      backgroundColor: ConstColors.yellow,
                    ),
                    clipBehavior: Clip.antiAlias,
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
                ),
                SizedBox(
                  width: getProportionateScreenWidth(defaultPadding),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
