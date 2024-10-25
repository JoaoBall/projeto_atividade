abstract class ServiceListener {
   void onServiceMessage(String message, {int? total, int? index});

  static String message(String message, int? total, int? index) {
    if (total == null) {
      return message;
    } else {
      return '[$index/$total] $message';
    }
  }
}
