library theme;

import 'package:flutter/material.dart';

class NullInkSplashFactory extends InteractiveInkFeatureFactory {
  const NullInkSplashFactory();

  @override
  InteractiveInkFeature create({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required Offset position,
    required Color color,
    required TextDirection textDirection,
    bool containedInkWell = false,
    RectCallback? rectCallback,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    double? radius,
    VoidCallback? onRemoved,
  }) {
    return NullInkSplash(controller, referenceBox);
  }
}

class NullInkSplash extends InteractiveInkFeature {
  NullInkSplash(MaterialInkController controller, RenderBox referenceBox)
      : super(
          controller: controller,
          referenceBox: referenceBox,
          color: Colors.transparent,
        );

  @override
  void confirm() {}

  @override
  void cancel() {}

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {}
}
