import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:projeto_atividade/widget/text/text_widget.dart';

class Messenger {
  static void snackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: TextWidget(text: message),
      ),
    );
  }

  static void dialog({
    required BuildContext context,
    bool dismissable = true,
    Widget? title,
    Widget? message,
    List<Widget>? actions,
  }) {
    showDialog(
      context: context,
      barrierDismissible: dismissable,
      builder: (context) {
        return dialogBuilder(
          context: context,
          canWillPop: dismissable,
          title: title,
          message: message,
          actions: actions,
        );
      },
    );
  }

  static Widget dialogWidget({
    required BuildContext context,
    Widget? title,
    Widget? message,
    List<Widget>? actions,
  }) {
    return AlertDialog(
      title: title,
      content: SingleChildScrollView(child: message),
      actions: actions ?? _dialogDefaultActions(context),
    );
  }

  static void dialogStateful({
    required BuildContext context,
    required Widget Function(BuildContext context, Function setState) builder,
    bool dismissable = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: dismissable,
      builder: (context) {
        return StatefulBuilder(builder: builder);
      },
    );
  }

  static Widget dialogBuilder({
    required BuildContext context,
    required bool canWillPop,
    Widget? title,
    Widget? message,
    List<Widget>? actions,
  }) {
    if (!canWillPop) {
      return WillPopScope(
        onWillPop: () => Future.value(false),
        child: AlertDialog(
          title: title,
          content: SingleChildScrollView(child: message),
          actions: actions ?? _dialogDefaultActions(context),
        ),
      );
    } else {
      return AlertDialog(
        title: title,
        content: SingleChildScrollView(child: message),
        actions: actions ?? _dialogDefaultActions(context),
      );
    }
  }

  static List<Widget> _dialogDefaultActions(BuildContext context) {
    return [
      TextButton(
        child: TextWidget(
          align: TextAlign.end,
          text: AppLocalizations.of(context)!.common_confirm.toUpperCase(),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    ];
  }

  static Future<DateTime?> datePicker(BuildContext context) {
    return showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
  }

  static Future<TimeOfDay?> timePicker(BuildContext context) {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
  }
}
