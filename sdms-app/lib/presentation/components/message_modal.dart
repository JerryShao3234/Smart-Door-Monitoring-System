// Flutter imports:
import 'package:flutter/material.dart' hide CloseButton;
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// Project imports:
import 'package:sdms_app/business/bloc/message_bloc.dart';
import 'package:sdms_app/globals.dart';
import 'package:sdms_app/presentation/components/close_button.dart';
import 'package:sdms_app/presentation/components/form_error.dart';
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/size_config.dart';
import 'package:sdms_app/presentation/theme/sdms_text.dart';

class MessageModal {
  /// The [BuildContext] on which you show the modal
  final BuildContext context;

  final String message;

  MessageModal({
    required this.context,
    required this.message,
  });

  late MemoryImage visitorImage = Globals.imageFromBase64String(
      context.read<MessageBloc>().state.currentVisit!.image);

  Future<T?> show<T>() {
    return showDialog<T>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return BlocProvider<MessageBloc>.value(
          value: context.read<MessageBloc>(),
          child: Dialog(
            insetPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(defaultPadding),
              vertical: getProportionateScreenHeight(defaultPadding),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              reverse: true,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(defaultPadding),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BlocBuilder<MessageBloc, MessageState>(
                        buildWhen: (previous, current) =>
                            previous.currentMessage != current.currentMessage ||
                            previous.replyStatus != current.replyStatus,
                        builder: (context, state) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    Globals.formatDateTime(
                                        state.currentMessage!.receivedAt),
                                    style: const SdmsText().primaryTitle,
                                  ),
                                  CloseButton(
                                    backgroundColor:
                                        ConstColors.buttonBackground,
                                    iconColor: ConstColors.iconGrey,
                                    onPressed: () => Navigator.pop(context),
                                  )
                                ],
                              ),
                              SizedBox(
                                  height: getProportionateScreenHeight(
                                      defaultPadding)),
                              Container(
                                height: getProportionateScreenHeight(120),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: visitorImage,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: getProportionateScreenHeight(
                                      defaultPadding)),
                              SizedBox(
                                height: getProportionateScreenHeight(70),
                                child: SingleChildScrollView(
                                  child: Text(
                                    state.currentMessage?.body ?? "No message",
                                    // message,
                                    style: const SdmsText().primaryRegular,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: getProportionateScreenHeight(
                                      defaultPadding)),
                              state.replyStatus == ReplyStatus.typing ||
                                      state.replyStatus ==
                                          ReplyStatus.success ||
                                      state.replyStatus == ReplyStatus.sending
                                  ? BlocBuilder<MessageBloc, MessageState>(
                                      buildWhen: (previous, current) =>
                                          previous.reply != current.reply ||
                                          previous.replyStatus !=
                                              current.replyStatus ||
                                          previous.error != current.error,
                                      builder: (context, state) {
                                        var maxCharacters = 200;
                                        return Column(
                                          children: [
                                            state.replyStatus ==
                                                    ReplyStatus.success
                                                ? SizedBox(
                                                    child: Text(
                                                      "Reply sent successfully. You may "
                                                      "now close this message.",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const SdmsText()
                                                          .primaryItalicBold,
                                                    ),
                                                  )
                                                : TextFormField(
                                                    maxLength: maxCharacters,
                                                    maxLengthEnforcement:
                                                        MaxLengthEnforcement
                                                            .enforced,
                                                    autofocus: true,
                                                    maxLines: null,
                                                    enabled: true,
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText:
                                                          'Type your message to play '
                                                          'on the SDMS speakers...',
                                                    ),
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    validator:
                                                        FormBuilderValidators
                                                            .compose([
                                                      FormBuilderValidators.max(
                                                        maxCharacters,
                                                      ),
                                                    ]),
                                                    onChanged: (replyText) {
                                                      context
                                                          .read<MessageBloc>()
                                                          .add(
                                                            MessageUpdateReply(
                                                                replyText:
                                                                    replyText),
                                                          );
                                                    },
                                                  ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox.square(
                                                  dimension:
                                                      getProportionateScreenHeight(
                                                          40),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      if (state.replyStatus ==
                                                          ReplyStatus.typing) {
                                                        context
                                                            .read<MessageBloc>()
                                                            .add(
                                                              const MessageSendReply(
                                                                messageInfo:
                                                                    null,
                                                              ),
                                                            );
                                                      }
                                                    },
                                                    hoverColor:
                                                        ConstColors.lightBlue,
                                                    tooltip: "Cancel",
                                                    icon: Icon(
                                                      Icons.cancel_outlined,
                                                      color: state.replyStatus ==
                                                                  ReplyStatus
                                                                      .sending ||
                                                              state.replyStatus ==
                                                                  ReplyStatus
                                                                      .success
                                                          ? ConstColors.grey50
                                                              .withOpacity(0.5)
                                                          : ConstColors.red,
                                                      size:
                                                          getProportionateScreenWidth(
                                                              30),
                                                    ),
                                                  ),
                                                ),
                                                state.replyStatus ==
                                                        ReplyStatus.success
                                                    ? SizedBox.square(
                                                        dimension:
                                                            getProportionateScreenHeight(
                                                                40),
                                                        child: IconButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          tooltip: "Finish",
                                                          icon: Icon(
                                                            Icons.check_circle,
                                                            color: Colors
                                                                .green[100],
                                                            size:
                                                                getProportionateScreenWidth(
                                                                    30),
                                                          ),
                                                        ),
                                                      )
                                                    : state.replyStatus ==
                                                            ReplyStatus.sending
                                                        ? SizedBox.square(
                                                            dimension:
                                                                getProportionateScreenHeight(
                                                                    40),
                                                            child: const Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                          )
                                                        : SizedBox.square(
                                                            dimension:
                                                                getProportionateScreenHeight(
                                                                    40),
                                                            child: IconButton(
                                                              onPressed: () {
                                                                if (state.reply !=
                                                                        null &&
                                                                    state.reply!
                                                                        .trim()
                                                                        .isNotEmpty) {
                                                                  context
                                                                      .read<
                                                                          MessageBloc>()
                                                                      .add(
                                                                        MessageSendReply(
                                                                          messageInfo:
                                                                              state.reply,
                                                                        ),
                                                                      );
                                                                }
                                                              },
                                                              hoverColor:
                                                                  ConstColors
                                                                      .lightBlue,
                                                              tooltip:
                                                                  "Send message",
                                                              icon: Icon(
                                                                Icons.send,
                                                                color: (state.reply !=
                                                                            null &&
                                                                        state
                                                                            .reply!
                                                                            .trim()
                                                                            .isNotEmpty)
                                                                    ? ConstColors
                                                                        .replyButtonBackground
                                                                    : ConstColors
                                                                        .grey50
                                                                        .withOpacity(
                                                                            0.5),
                                                                size:
                                                                    getProportionateScreenWidth(
                                                                        30),
                                                              ),
                                                            ),
                                                          )
                                              ],
                                            ),
                                            SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        defaultPadding)),
                                          ],
                                        );
                                      },
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height:
                                              getProportionateScreenHeight(50),
                                          width:
                                              getProportionateScreenWidth(120),
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              elevation: 5.0,
                                              textStyle: const SdmsText()
                                                  .primarySemiBold,
                                              backgroundColor: ConstColors
                                                  .replyButtonBackground,
                                              foregroundColor:
                                                  ConstColors.replyButtonText,
                                            ),
                                            onPressed: () {
                                              context.read<MessageBloc>().add(
                                                    const MessageSendReply(
                                                      messageInfo: null,
                                                    ),
                                                  );
                                            },
                                            child: const Text('Reply'),
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              getProportionateScreenHeight(50),
                                          width:
                                              getProportionateScreenWidth(120),
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              elevation: 5.0,
                                              textStyle: const SdmsText()
                                                  .primarySemiBold,
                                              backgroundColor:
                                                  ConstColors.replyButtonText,
                                              foregroundColor: ConstColors
                                                  .replyButtonBackground,
                                            ),
                                            onPressed: () {
                                              if (state.replyStatus !=
                                                  ReplyStatus.marked) {
                                                context.read<MessageBloc>().add(
                                                      MessageMarkReadUnread(
                                                        messageId: state
                                                            .currentMessage!.id,
                                                      ),
                                                    );
                                              }
                                            },
                                            child: state.replyStatus ==
                                                    ReplyStatus.marking
                                                ? const CircularProgressIndicator()
                                                : state.replyStatus ==
                                                        ReplyStatus.marked
                                                    ? const Icon(
                                                        Icons.check,
                                                        color: Colors.green,
                                                      )
                                                    : const Text(
                                                        'Mark as Read'),
                                          ),
                                        ),
                                      ],
                                    ),
                              state.error != null
                                  ? FormError(text: state.error)
                                  : SizedBox(
                                      height: getProportionateScreenHeight(
                                          defaultPadding)),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
