library appbar;

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppbarSearchbar extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final IconData prefixIcon;
  const AppbarSearchbar({
    super.key,
    this.onChanged,
    this.onSubmitted,
    this.prefixIcon = PhosphorIcons.magnifyingGlassBold,
  });

  @override
  State<AppbarSearchbar> createState() => _AppbarSearchbarState();
}

class _AppbarSearchbarState extends State<AppbarSearchbar> {
  final focus = FocusNode();
  final controller = TextEditingController();
  late bool focused = focus.hasFocus;

  @override
  void initState() {
    super.initState();
    focus.addListener(() {
      if (focus.hasFocus != focused) {
        setState(() {
          focused = focus.hasFocus;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final focusedColor = Theme.of(context)
        .dividerColor
        .withOpacity(Theme.of(context).dividerColor.opacity + 0.2);
    final defaultColor = Theme.of(context).dividerColor;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 8),
      child: IconTheme(
        data: IconThemeData(
          color: defaultColor,
        ),
        child: TextField(
          focusNode: focus,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            prefixIcon: Icon(
              widget.prefixIcon,
              size: 12,
              color: focused ? focusedColor : defaultColor,
            ),
            constraints: const BoxConstraints.expand(height: 32),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: defaultColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: focusedColor),
              gapPadding: 0,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: defaultColor),
            ),
          ),
          textAlignVertical: TextAlignVertical.center,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: focused ? null : focusedColor),
          cursorColor: focusedColor,
        ),
      ),
    );
  }
}
