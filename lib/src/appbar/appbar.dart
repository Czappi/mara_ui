library appbar;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mara_ui/src/appbar/button_row.dart';
import 'package:mara_ui/src/appbar/window_buttons.dart';
import 'package:mara_ui/src/tabbar/tabbar.dart' as mara;
import 'package:window_manager/window_manager.dart';

class Appbar extends StatefulWidget {
  final Duration animationSpeed;
  final double height;
  final mara.TabBar? tabBar;
  final AppBarButtonRow? buttonRow;
  const Appbar({
    super.key,
    this.animationSpeed = const Duration(milliseconds: 150),
    this.height = 40,
    this.tabBar,
    this.buttonRow,
  });

  @override
  State<Appbar> createState() => _AppbarState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<Duration>('animationSpeed', animationSpeed));
    properties.add(DoubleProperty('height', height));
    properties.add(DiagnosticsProperty<mara.TabBar?>('tabBar', tabBar));
    properties
        .add(DiagnosticsProperty<AppBarButtonRow?>('buttonRow', buttonRow));
  }
}

class _AppbarState extends State<Appbar> with SingleTickerProviderStateMixin {
  late final AnimationController animationController =
      AnimationController(vsync: this, upperBound: 0.5);

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: MouseRegion(
        opaque: false,
        onEnter: (event) async {
          await animationController
              .animateTo(
                Theme.of(context).dividerColor.opacity,
                duration: widget.animationSpeed,
              )
              .orCancel;
        },
        onExit: (event) async {
          await animationController
              .animateBack(0, duration: widget.animationSpeed)
              .orCancel;
        },
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Container(
              height: widget.height,
              foregroundDecoration: BoxDecoration(
                border: BorderDirectional(
                  bottom: BorderSide(
                    color: Theme.of(context)
                        .dividerColor
                        .withOpacity(animationController.value),
                  ),
                ),
              ),
              child: child,
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.buttonRow != null)
                DragToMoveArea(
                  child: widget.buttonRow!,
                ),
              if (widget.tabBar != null)
                Expanded(
                  child: DragToMoveArea(
                    child: widget.tabBar ?? const SizedBox(),
                  ),
                ),
              WindowButtons(
                backgroundColor: Theme.of(context).backgroundColor,
                brightness: Theme.of(context).brightness,
                height: widget.height,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
