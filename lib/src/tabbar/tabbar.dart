library tabbar;

import 'package:flutter/material.dart';
import 'package:mara_ui/src/tabbar/tab.dart' as mara;
import 'package:mara_ui/src/tabbar/tab.dart';
//import 'package:window_manager/window_manager.dart';

class TabBar extends StatelessWidget {
  final double height;
  final ScrollController controller;
  final List<mara.Tab> tabs;
  final void Function(mara.Tab) openEvent;
  final void Function(mara.Tab) closeEvent;
  final int opened;
  const TabBar({
    Key? key,
    this.height = 80,
    required this.openEvent,
    required this.closeEvent,
    required this.controller,
    required this.tabs,
    required this.opened,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return BlocBuilder<TabEvent, TabState>(
      bloc: tabBloc,
      builder: (context, state, addEvent) {*/
    return Container(
      color: Theme.of(context).backgroundColor,
      height: height,
      child: /*Stack(
            children: [
              DragToMoveArea(
                child: SizedBox(
                  height: widget.height,
                  width: double.infinity,
                ),
              ),*/
          CustomScrollView(
        shrinkWrap: true,
        controller: controller,
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                var tab = tabs[index];
                bool isOpen = opened == index;

                return TabWidget(
                  title: tab.title,
                  location: tab.location,
                  isOpen: isOpen,
                  openEvent: () {
                    //addEvent(OpenTabEvent(tab: tab));
                  },
                  closeEvent: () {
                    openEvent(tab);
                    //addEvent(CloseTabEvent(tab: tab));
                  },
                );
              },
              childCount: tabs.length,
            ),
          ),
        ],
      ),
      //],
      //),
    );
    //},
    //);
  }
}
