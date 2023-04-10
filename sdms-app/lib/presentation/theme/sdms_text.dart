// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:sdms_app/presentation/constants.dart';

/// A Theme Extension for managing [TextStyle]s through the entire app.
class SdmsText extends ThemeExtension<SdmsText> {
  const SdmsText();

  @override
  ThemeExtension<SdmsText> copyWith() {
    return this;
  }

  @override
  ThemeExtension<SdmsText> lerp(ThemeExtension<SdmsText>? other, double t) {
    return this;
  }

  /// The largest title style used on the login screen, 56pt semiBold.
  TextStyle get title {
    return const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 56,
      height: 1.2,
      color: ConstColors.darkBlue,
    );
  }

  /// The 2nd largest title style used on the Create Account screen.
  TextStyle get title2 {
    return const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 40,
      height: 1.2,
      color: ConstColors.darkBlue,
    );
  }

  /// The 3rd largest title style used on the Forgot Password screen.
  TextStyle get title3 {
    return const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 38,
      height: 1.2,
      color: ConstColors.darkBlue,
    );
  }

  /// The primary title style for main titles, 24pt semiBold.
  TextStyle get primaryTitle {
    return const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 24,
      height: 1.2,
      color: ConstColors.darkBlue,
    );
  }

  /// Regular text, 16pt normal.
  TextStyle get primaryRegular {
    return const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.5,
      color: ConstColors.darkBlue,
    );
  }

  /// Regular semibold text, 16pt semiBold.
  TextStyle get primarySemiBold {
    return const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: 1.5,
      color: ConstColors.darkBlue,
    );
  }

  /// Regular italic bolded text, 16pt italic semiBold.
  TextStyle get primaryItalicBold {
    return const TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,
      fontSize: 16,
      height: 1.5,
      color: ConstColors.darkBlue,
    );
  }

  /// Regular italic text, 16pt italic.
  TextStyle get primaryItalic {
    return const TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
      fontSize: 16,
      height: 1.5,
      color: ConstColors.darkBlue,
    );
  }

  /// For really standout numbers, 36pt semiBold.
  TextStyle get titleNumbers {
    return const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 30,
      height: 1.2,
      color: ConstColors.darkBlue,
    );
  }

  // 12 pt semiBold font.
  TextStyle get caption1SemiBold {
    return const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 12,
      height: 1.2,
      color: ConstColors.darkBlue,
    );
  }

  /// Regular text, 16pt normal.
  TextStyle get primaryRegularRed {
    return const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.5,
      color: ConstColors.red,
    );
  }

  /// Regular semibold text, 16pt semiBold.
  TextStyle get primarySemiBoldRed {
    return const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: 1.5,
      color: ConstColors.red,
    );
  }
}
