// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:sdms_app/business/bloc/message_bloc.dart';
import 'package:sdms_app/presentation/components/sdms_app_bar.dart';
import 'package:sdms_app/presentation/components/sdms_sidebar_menu.dart';
import 'package:sdms_app/presentation/screens/settings/components/body.dart';
import 'package:sdms_app/presentation/size_config.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: SDMSAppBar(
        appBarTitle: "Settings",
        callback: () => _scaffoldKey.currentState!.openDrawer(),
      ),
      drawer:
          SidebarMenu(userName: context.read<MessageBloc>().state.user.name),
      body: const Body(),
    );
  }
}
