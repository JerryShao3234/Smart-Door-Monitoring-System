// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:sdms_app/business/bloc/message_bloc.dart';
import 'package:sdms_app/data/binding.dart';
import 'package:sdms_app/data/repositories/message_repository.dart';
import 'package:sdms_app/presentation/components/message_card.dart';
import 'package:sdms_app/presentation/components/message_modal.dart';
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/size_config.dart';
import 'package:sdms_app/presentation/theme/sdms_text.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(defaultPadding),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(700),
              width: getProportionateScreenWidth(360),
              child: RepositoryProvider(
                create: (context) => MessageRepository(
                  messageProvider: AppDataBinding.messageProvider,
                ),
                child: BlocBuilder<MessageBloc, MessageState>(
                  buildWhen: (previous, current) =>
                      previous.currentMessage != current.currentMessage ||
                      previous.error != null ||
                      previous.unreadMessages != current.unreadMessages ||
                      previous.replyStatus != current.replyStatus,
                  builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(defaultPadding),
                          child: state.unreadMessages.isEmpty
                              ? RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Your inbox is clean!',
                                        style: const SdmsText().primaryTitle,
                                      ),
                                    ],
                                  ),
                                )
                              : RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '${state.unreadMessages.length} ',
                                        style: const SdmsText().titleNumbers,
                                      ),
                                      TextSpan(
                                        text: 'total messages:',
                                        style: const SdmsText().primaryTitle,
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(250),
                          child: state.unreadMessages.isEmpty
                              ? SizedBox(
                                  width: getProportionateScreenWidth(200),
                                  child: Image.asset(
                                    "assets/images/watering-plant.png",
                                    fit: BoxFit.contain,
                                  ),
                                )
                              : SingleChildScrollView(
                                  physics: const ScrollPhysics(),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(500),
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          padding: EdgeInsets.all(
                                              getProportionateScreenHeight(2)),
                                          itemCount:
                                              state.unreadMessages.length,
                                          itemBuilder:
                                              (BuildContext context, index) {
                                            return Column(
                                              children: [
                                                Material(
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                50)),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      context
                                                          .read<MessageBloc>()
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
                                                          .unreadMessages[index]
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
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
