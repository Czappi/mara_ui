library appbar;

import 'package:flutter/material.dart';
import 'package:mara_ui/src/appbar/button.dart';
import 'package:mara_ui/src/appbar/searchbar.dart';

class AppBarButtonRow extends StatelessWidget {
  final List<AppBarButton> buttons;
  final double height, width;
  final AppbarSearchbar? searchbar;
  const AppBarButtonRow({
    Key? key,
    this.height = 40,
    this.width = 300,
    required this.buttons,
    this.searchbar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          children: [
            /*AppBarButton(
              icon: PhosphorIcons.list,
              onPressed: () {},
            ),
            AppBarButton(
              icon: PhosphorIcons.floppyDisk,
              iconSize: 18,
              onPressed: () {},
            ),
            AppBarButton(
              icon: PhosphorIcons.arrowCounterClockwise,
              iconSize: 18,
              onPressed: () {},
            ),*/
            ...buttons,
            if (searchbar != null)
              Expanded(
                child: searchbar!,
              ),
          ],
        ),
      ),
    );
  }
}
