// Flutter imports:
import 'package:flutter/material.dart';

/// Wrapper class for all theme color constants
class ConstColors {
  static const Color lightBlue = Color(0xFFE8F6EF);
  static const Color mediumBlue = Color(0xFFB8DFD8);
  static const Color darkBlue = Color(0xFF4C4C6D);
  static const Color yellow = Color(0xFFFFE194);

  // The colors for the global app bar

  static const Color appBarBg = Color(0xFF7E7F85);
  static const Color appBarText = Color(0xFFE8F1FF);

  // The colors for the sidebar drawer menu
  static const Color drawerHeader = Color.fromARGB(255, 169, 177, 224);

  // The colors for text and buttons
  static const Color strokeEntry = Color(0xFFF3F5FF);
  static const Color text = Color(0xFF111733);
  static const Color textBlack = Color(0xFF202024);
  static const Color subText = Color(0xFF768195);
  static const Color buttonBackground = Color.fromARGB(255, 207, 209, 215);
  // static const Color buttonHighlight = Color.fromARGB(255, 126, 153, 205);
  static const Color grey50 = Color(0xFF7E7F85);
  static const Color replyButtonBackground = Colors.lightBlue;
  static const Color replyButtonText = Colors.white;

  /// The color for error widgets
  static const Color red = Color(0xFFFC6F6F);

  // The colors for icons
  static const Color iconBlack = Color(0xFF31364E);
  static const Color iconGrey = Color(0xFFA6AEBD);
}

/// The global default padding for use on most screens in the app - 20
const double defaultPadding = 20;
