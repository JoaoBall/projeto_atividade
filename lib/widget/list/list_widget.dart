import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  final bool shrinkWrap;
  final List data;
  final Function builder;

  const ListWidget({
    super.key,
    this.shrinkWrap = false,
    required this.data,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: key,
        shrinkWrap: shrinkWrap,
        itemCount: data.length,
        itemBuilder: (context, i) => builder(data[i]),
       );
  }
}
