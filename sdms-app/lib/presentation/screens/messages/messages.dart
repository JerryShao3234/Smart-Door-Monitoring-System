// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:sdms_app/business/bloc/message_bloc.dart';
import 'package:sdms_app/presentation/components/sdms_app_bar.dart';
import 'package:sdms_app/presentation/components/sdms_sidebar_menu.dart';
import 'package:sdms_app/presentation/screens/messages/components/body.dart';
import 'package:sdms_app/presentation/size_config.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: SDMSAppBar(
        appBarTitle: "All messages",
        callback: () => _scaffoldKey.currentState!.openDrawer(),
      ),
      drawer:
          SidebarMenu(userName: context.read<MessageBloc>().state.user.name),
      body: const Body(),
    );
  }
}
