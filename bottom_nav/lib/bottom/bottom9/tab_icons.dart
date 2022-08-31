import 'package:flutter/material.dart';

import 'tabIcon_data.dart';

class TabIcons extends StatefulWidget {
  const TabIcons({
    Key? key,
    required this.tabIconData,
    required this.removeAllSelect,
    required this.onSelect,
  }) : super(key: key);

  final TabIconData tabIconData;

  // 动画执行之后回调
  final Function removeAllSelect;
  final Function onSelect;

  @override
  TabIconsState createState() => TabIconsState();
}

class TabIconsState extends State<TabIcons> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (!widget.tabIconData.isSelected) {
          widget.onSelect();
        }
      },
      child: IgnorePointer(
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 100),
            style: TextStyle(
                fontSize: widget.tabIconData.isSelected ? 16.6 : 15,
                color:
                    widget.tabIconData.isSelected ? Colors.white : Colors.grey),
            child: Text(widget.tabIconData.name),
          ),
        ),
      ),
    );
  }
}
