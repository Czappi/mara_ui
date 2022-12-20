library tabbar;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mara_ui/src/utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum FileStyle { gitStaged, gitModified, gitUntracked, deleted, normal }

class TabWidget extends StatefulWidget {
  final String title, location;
  final bool isOpen;
  final void Function() openEvent, closeEvent;
  final FileStyle style;
  const TabWidget({
    Key? key,
    required this.title,
    required this.location,
    required this.isOpen,
    required this.openEvent,
    required this.closeEvent,
    this.style = FileStyle.normal,
  }) : super(key: key);

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextButton(
        onHover: ((value) {
          setState(() {
            hovered = value;
          });
        }),
        onPressed: widget.openEvent,
        style: Theme.of(context).textButtonTheme.style!.copyWith(
              minimumSize: MaterialStateProperty.all(const Size(100, 40)),
              maximumSize: MaterialStateProperty.all(const Size(200, 100)),
            ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                PhosphorIcons.fileDocBold,
                size: 16,
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 68),
              child: Text(widget.title),
            ),
            AspectRatio(
              aspectRatio: 1,
              child: IconButton(
                iconSize: 12,
                splashRadius: 12,
                onPressed: widget.closeEvent,
                icon: Icon(
                  PhosphorIcons.xBold,
                  color: hovered ? null : Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tab {
  final String title;
  final String location;
  const Tab({
    required this.title,
    required this.location,
  });

  String? get fileExtension => FileUtils.getExtensionFromPath(location);

  Tab copyWith({
    String? title,
    String? location,
  }) {
    return Tab(
      title: title ?? this.title,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'location': location,
    };
  }

  factory Tab.fromMap(Map<String, dynamic> map) {
    return Tab(
      title: map['title'] ?? '',
      location: map['location'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Tab.fromJson(String source) => Tab.fromMap(json.decode(source));

  @override
  String toString() => 'Tab(title: $title, location: $location)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tab && other.title == title && other.location == location;
  }

  @override
  int get hashCode => title.hashCode ^ location.hashCode;
}
