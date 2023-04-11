// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:sdms_app/business/bloc/message_bloc.dart';
import 'package:sdms_app/presentation/components/loading.dart';
import 'package:sdms_app/presentation/components/message_card.dart';
import 'package:sdms_app/presentation/components/message_modal.dart';
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/routes/home_locations.dart';
import 'package:sdms_app/presentation/screens/home/components/navigate_button.dart';
import 'package:sdms_app/presentation/size_config.dart';
import 'package:sdms_app/presentation/theme/sdms_text.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    context.read<MessageBloc>().add(const MessageGetAll());
    super.initState();
  }

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
          child: BlocBuilder<MessageBloc, MessageState>(
            buildWhen: (previous, current) =>
                previous.unreadMessages != current.unreadMessages ||
                previous.visits != current.visits ||
                previous.messages != current.messages ||
                previous.messageStatus != current.messageStatus,
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(700),
                    width: getProportionateScreenWidth(360),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(defaultPadding),
                          child: state.unreadMessages.isEmpty
                              ? Text(
                                  "You currently have no unread messages.",
                                  style: const SdmsText().primaryTitle,
                                )
                              : RichText(
                                  text: TextSpan(
                                    text: "You have ",
                                    style: const SdmsText().primaryTitle,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '${state.unreadMessages.length} ',
                                        style: const SdmsText().titleNumbers,
                                      ),
                                      TextSpan(
                                        text: 'unread messages: ',
                                        style: const SdmsText().primaryTitle,
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(200),
                          child: state.messageStatus == LoadingStatus.loading
                              ? const Loading()
                              : state.unreadMessages.isEmpty
                                  ? Image.asset(
                                      "assets/images/holding-list-shrug.png",
                                      fit: BoxFit.cover,
                                    )
                                  : SingleChildScrollView(
                                      physics: const ScrollPhysics(),
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            height:
                                                getProportionateScreenHeight(
                                                    200),
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              padding: EdgeInsets.all(
                                                  getProportionateScreenHeight(
                                                      2)),
                                              itemCount:
                                                  state.unreadMessages.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      index) {
                                                return Column(
                                                  children: [
                                                    Material(
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    30)),
                                                      ),
                                                      child: InkWell(
                                                        onTap: () {
                                                          context
                                                              .read<
                                                                  MessageBloc>()
                                                              .add(MessageViewMessage(
                                                                  id: state
                                                                      .unreadMessages[
                                                                          index]
                                                                      .id));

                                                          MessageModal(
                                                            context: context,
                                                            message: state
                                                                    .unreadMessages[
                                                                        index]
                                                                    .body ??
                                                                "Empty message",
                                                          ).show();
                                                        },
                                                        child: MessageCard(
                                                          receivedAt: state
                                                              .unreadMessages[
                                                                  index]
                                                              .receivedAt,
                                                          message: state
                                                                  .unreadMessages[
                                                                      index]
                                                                  .body ??
                                                              "Empty Message",
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              5),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                        ),
                        state.unreadMessages.isEmpty
                            ? const Spacer()
                            : Row(
                                children: [
                                  const Spacer(),
                                  InkWell(
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          getProportionateScreenWidth(20)),
                                      child: Text(
                                        "View all unread messages >",
                                        style: const SdmsText().primaryItalic,
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                    onTap: () {
                                      Beamer.of(context).beamToNamed(
                                          HomeLocations.messagesRoute);
                                    },
                                  ),
                                ],
                              ),
                        SizedBox(
                          height: getProportionateScreenHeight(300),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const NavigateButton(
                                    icon: Icons.message_rounded,
                                    tooltip: "All unread messages",
                                    destination: HomeLocations.messagesRoute,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(30),
                                  ),
                                  const NavigateButton(
                                    icon: Icons.history_rounded,
                                    tooltip: "Visitor history",
                                    destination:
                                        HomeLocations.visitorHistoryRoute,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const NavigateButton(
                                    icon: Icons.edit,
                                    tooltip: "Customize SDMS",
                                    destination: HomeLocations.customizeRoute,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenHeight(30),
                                  ),
                                  const NavigateButton(
                                    icon: Icons.settings,
                                    tooltip: "Settings",
                                    destination: HomeLocations.settingsRoute,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
