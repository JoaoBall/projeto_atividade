import 'package:flutter/material.dart';

class RouteWidget extends MaterialPageRoute {
  final Duration? animationDuration;

  RouteWidget({
    required super.builder,
    super.settings,
    super.maintainState,
    super.fullscreenDialog,
    super.allowSnapshotting,
    this.animationDuration,
  });

  @override
  Duration get transitionDuration => animationDuration ?? super.transitionDuration;

  @override
  Duration get reverseTransitionDuration => animationDuration ?? super.reverseTransitionDuration;
}
