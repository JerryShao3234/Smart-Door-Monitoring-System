// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:sdms_app/business/exceptions/failure_code.enum.dart';
import 'package:sdms_app/data/models/message.dart';
import 'package:sdms_app/data/models/visit.dart';
import 'package:sdms_app/data/repositories/message_repository.dart';
import 'package:sdms_app/globals.dart';

class MessageProvider extends MessageDataProvider {
  /// Returns all the visits associated with the current User.
  @override
  Future<List<Visit>> getAllVisits(String token) async {
    try {
      var response = await http.post(
        Uri.http(
          Globals.cloudUrl,
          'getvisits',
        ),
        body: {
          "token": token,
        },
      ).timeout(
        const Duration(seconds: 3),
        onTimeout: () => throw FailureCode.connectionFailed.message,
      );

      final responseList = jsonDecode(response.body);
      final List<Visit> visits = [];

      for (var i in responseList) {
        visits.add(Visit.fromJson(i));
      }

      return visits;
    } catch (e) {
      print(e);
      throw FailureCode.connectionFailed.message;
    }
  }

  @override
  Future<void> markAsRead(
    String token,
    String messageID,
  ) async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      var response = await http.post(
        Uri.http(
          Globals.cloudUrl,
          'readmessage',
        ),
        body: {
          "token": token,
          "messageID": messageID,
        },
      ).timeout(
        const Duration(seconds: 3),
        onTimeout: () => throw FailureCode.connectionFailed.message,
      );

      if (response.statusCode != 200) {
        throw FailureCode.connectionFailed.message;
      }
    } catch (e) {
      print(e);
      throw FailureCode.connectionFailed.message;
    }
  }

  @override
  Future<void> sendMessage(
    String token,
    String messageInfo,
  ) async {
    await Future.delayed(const Duration(seconds: 2));

    try {
      var response = await http.post(
        Uri.http(
          Globals.cloudUrl,
          'usermessage',
        ),
        body: {
          "token": token,
          "messageID": messageInfo,
        },
      ).timeout(
        const Duration(seconds: 5),
        onTimeout: () => throw FailureCode.connectionFailed.message,
      );

      if (response.statusCode != 200) {
        throw FailureCode.connectionFailed.message;
      }
    } catch (e) {
      print(e);
      throw FailureCode.connectionFailed.message;
    }
  }

  /// Extracts all messages from [visits], which is a list containing
  /// multiple [Visit]s.
  @override
  List<Message> getAllMessages(List<Visit> visits) {
    final List<Message> allMessages = [];

    for (var v in visits) {
      var messages = v.messages;

      for (var m in messages) {
        if (m.body != null) {
          allMessages.add(m);
        }
      }
    }

    return allMessages;
  }

  /// Returns from [messages] a list of messages marked as unread.
  @override
  List<Message> getUnreadMessages(List<Message> messages) {
    final List<Message> unreadMessages = [];

    for (var m in messages) {
      if (m.body != null && m.markedAsRead == false && m.sender != "user") {
        unreadMessages.add(m);
      }
    }

    return unreadMessages;
  }
}
