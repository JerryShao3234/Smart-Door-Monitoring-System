// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:sdms_app/business/bloc/message_bloc.dart';
import 'package:sdms_app/globals.dart';
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/screens/visitor_history/components/visitor_preview.dart';
import 'package:sdms_app/presentation/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(defaultPadding),
        ),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(defaultPadding),
              ),
              BlocProvider.value(
                value: context.read<MessageBloc>(),
                child: BlocBuilder<MessageBloc, MessageState>(
                  buildWhen: (previous, current) =>
                      previous.visits != current.visits,
                  builder: (context, state) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.visits.length,
                        itemBuilder: ((context, index) {
                          var visit = state.visits[index];
                          final List<Map<String, String>> visitMessages = [];

                          for (var m in visit.messages) {
                            if (m.body != null) {
                              visitMessages.add({
                                "from": m.sender,
                                "text": m.body!,
                              });
                            }
                          }

                          return VisitorPreview(
                            dateAndTime: Globals.formatDateTime(visit.date),
                            messages: visitMessages,
                            imageData: visit.image,
                          );
                        }),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(getProportionateScreenHeight(15)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
