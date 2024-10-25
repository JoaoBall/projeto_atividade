import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:projeto_atividade/widget/text/text_widget.dart';
// ignore_for_file: null_check_on_nullable_type_parameter



class FutureWidget<T> extends StatelessWidget {
  final bool enableEmptyMessage;
  final Future<T> future;
  final Widget Function(BuildContext, T) widget;

  const FutureWidget({
    super.key,
    this.enableEmptyMessage = true,
    required this.future,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      key: key,
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _widget(context, snapshot.data!);
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _widget(BuildContext context, T data) {
    if (data is List) {
      if (data.isEmpty) {
        if (enableEmptyMessage) {
          return Center(
            child: TextWidget(
              text: AppLocalizations.of(context)!.common_empty_list,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      }
    }

    return widget(context, data);
  }
}
