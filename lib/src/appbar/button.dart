library appbar;

import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final double iconSize;
  const AppBarButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.iconSize = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(24, 24)),
        fixedSize: MaterialStateProperty.all(const Size(36, 32)),
        padding: MaterialStateProperty.all(
          const EdgeInsets.fromLTRB(6, 12, 6, 12),
        ),
        foregroundColor: MaterialStateProperty.all(
          Theme.of(context).colorScheme.onBackground,
        ),
      ),
      child: Icon(
        icon,
        size: iconSize,
      ),
    );
  }
}
