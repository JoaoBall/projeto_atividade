import 'package:flutter/material.dart';
import 'package:projeto_atividade/widget/text/text_widget.dart';


class TextButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;

  const TextButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: key,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
      ),
      onPressed: () => onPressed(),
      child: TextWidget(text: text),
    );
  }
}
