import 'package:flutter/material.dart';

abstract class BasePage extends StatefulWidget {
  final Function? onBackRefresh;

  const BasePage({super.key, this.onBackRefresh});
}
