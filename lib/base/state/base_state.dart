import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  late AppLocalizations Strings = AppLocalizations.of(context)!;

  bool loaded = false;

  Future<bool> onLoad() async {
    loaded = true;

    return loaded;
  }

  void onRefresh({Function? action}) {
    setState(() {
      action?.call();
    });
  }
}
