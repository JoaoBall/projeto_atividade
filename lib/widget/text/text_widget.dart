import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final bool enabled;
  final String? text;
  final TextAlign? align;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextOverflow? overflow;

  const TextWidget({
    super.key,
    this.enabled = true,
    required this.text,
    this.align,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '[NULL]',
      key: key,
      textAlign: align,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: enabled ? color : Colors.grey,
        overflow: overflow,
      ),
    );
  }
}
