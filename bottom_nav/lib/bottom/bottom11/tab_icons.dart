import 'package:bottom_nav/bottom/bottom11/tabIcon_data.dart';
import 'package:flutter/material.dart';

class TabIcons extends StatefulWidget {
  const TabIcons({
    Key? key,
    required this.tabIconData,
    required this.removeAllSelect,
    required this.rect,
    required this.normalIconSize,
    required this.isChecked,
  }) : super(key: key);

  final TabIconData tabIconData;
  final Function removeAllSelect;
  final Rect rect;
  final double normalIconSize;

  // 是否选中
  final bool isChecked;

  @override
  TabIconsState createState() => TabIconsState();
}

class TabIconsState extends State<TabIcons> {
  @override
  Widget build(BuildContext context) {
    return Positioned.fromRect(
      rect: widget.rect,
      child: InkWell(
        onTap: () {
          // 去重点击
          if (!widget.isChecked) {
            widget.removeAllSelect();
          }
        },
        child: Align(
          alignment: Alignment.center,
          child: AnimatedDefaultTextStyle(
            curve: const Cubic(0.68, 0, 0, 4.6),
            duration: const Duration(milliseconds: 600),
            style: TextStyle(
              fontSize: widget.isChecked ? 17 : 16,
              color: widget.isChecked
                  ? Colors.pink.withOpacity(0.5)
                  : Colors.pink.withOpacity(0.3),
              fontWeight: FontWeight.w600,
            ),
            child: Text(widget.tabIconData.title),
          ),
        ),
      ),
    );
  }
}
