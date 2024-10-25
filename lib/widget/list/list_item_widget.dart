import 'package:flutter/material.dart';
import 'package:projeto_atividade/util/color_helper.dart';

class ListItemWidget<T> extends StatelessWidget {
  final bool enableBorder;
  final Widget Function(BuildContext) widget;
  final Color? borderColor;
  final void Function(BuildContext)? onTap;
  final void Function(BuildContext)? onLongPress;

  const ListItemWidget({
    super.key,
    this.enableBorder = true,
    required this.widget,
    this.borderColor,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      key: key,
      margin: const EdgeInsets.all(2.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: enableBorder
                ? Border(
                    left: BorderSide(
                      width: 2.0,
                      color: borderColor ?? ColorHelper.primaryColor,
                    ),
                  )
                : null,
          ),
          child: widget(context),
        ),
        onTap: () => onTap?.call(context),
        onLongPress: () => onLongPress?.call(context),
      ),
    );
  }
}
