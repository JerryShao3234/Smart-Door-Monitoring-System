enum FailureCode {
  unknown(code: "unknown"),
  duplicateEmail(code: "duplicate-email"),
  connectionFailed(code: "connection-failed");

  final String code;

  const FailureCode({required this.code});

  String get message {
    switch (this) {
      case FailureCode.unknown:
        return "An unknown error occurred, please try again later.";
      case FailureCode.duplicateEmail:
        return "An account already exists for that e-mail.";
      case FailureCode.connectionFailed:
        return "Unable to retrieve data. Please make sure you are connected "
            "to the internet and try again.";
    }
  }
}
