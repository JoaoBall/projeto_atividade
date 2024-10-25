import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_atividade/util/color_helper.dart';

class TextFormFieldWidget extends StatelessWidget {
  final bool enabled;
  final bool autocolor;
  final String? label;
  final String? value;
  final Color? color;
  final int? maxLines;
  final Icon? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;

  const TextFormFieldWidget({
    super.key,
    this.enabled = true,
    this.autocolor = true,
    this.label,
    this.value,
    this.color,
    this.maxLines,
    this.suffixIcon,
    this.controller,
    this.inputType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle;
    final TextStyle? labelStyle;

    if (autocolor) {
      textStyle = TextStyle(color: enabled ? color : Colors.grey);
      labelStyle =
          TextStyle(color: enabled ? ColorHelper.primaryColor : Colors.grey);
    } else {
      textStyle = TextStyle(color: color);
      labelStyle = const TextStyle(color: ColorHelper.primaryColor);
    }

    return TextFormField(
      enabled: enabled,
      decoration: InputDecoration(
        labelStyle: labelStyle,
        labelText: label,
        suffixIcon: suffixIcon,
      ),
      initialValue: value,
      controller: controller,
      style: textStyle,
      minLines: 1,
      maxLines: maxLines,
      keyboardType: inputType,
      inputFormatters: [...?inputFormatters],
    );
  }
}
