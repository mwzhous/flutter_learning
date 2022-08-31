import 'dart:math';

import 'package:flutter/material.dart';

class Chap1205 extends StatelessWidget {
  const Chap1205({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('05:  Flow 弧形排布'),
      ),
      body: const Directionality(
        textDirection: TextDirection.ltr,
        child: FlowMenu(),
      ),
    );
  }
}

class FlowMenu extends StatefulWidget {
  static const List<IconData> menuItems = <IconData>[
    Icons.menu,
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    // Icons.refresh,
    // Icons.close,
  ];

  const FlowMenu({Key? key}) : super(key: key);

  @override
  State<FlowMenu> createState() => _FlowMenuState();
}

class _FlowMenuState extends State<FlowMenu> {
  Widget flowMenuItem(IconData icon) {
    return RawMaterialButton(
      fillColor: Colors.blue,
      // splashColor: Colors.amber[100],
      shape: const CircleBorder(),
      constraints: BoxConstraints.tight(const Size(40, 40)),
      onPressed: () {},
      child: Icon(
        icon,
        color: Colors.white,
        size: 25.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: ColoredBox(
        color: Colors.orange.withOpacity(0.2),
        child: Flow(
          delegate: CircleFlowDelegate(),
          children: FlowMenu.menuItems
              .map<Widget>((IconData icon) => flowMenuItem(icon))
              .toList(),
        ),
      ),
    );
  }
}

class CircleFlowDelegate extends FlowDelegate {
  @override
  bool shouldRepaint(CircleFlowDelegate oldDelegate) {
    return true;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    final radius = constraints.biggest.shortestSide;
    return Size(radius, radius);
  }

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return constraints.loosen();
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    if (context.childCount == 0) return;
    final double radius = context.size.shortestSide / 2;

    final int count = context.childCount - 1;
    double angle = 120;
    double progress = 0.8;
    final double perRad = angle / 180 * pi / (count - 1);
    final double fixRotate = (angle / 2) / 180 * pi;

    for (int i = 0; i < count; i++) {
      final Size size = context.getChildSize(i) ?? Size.zero;
      final double offsetX =
          progress * (radius - size.width / 2) * cos(i * perRad - fixRotate) +
              radius;
      final double offsetY =
          progress * (radius - size.height / 2) * sin(i * perRad - fixRotate) +
              radius;
      context.paintChild(i + 1,
          transform: Matrix4.translationValues(
              offsetX - size.width / 2, offsetY - size.height / 2, 0.0));
    }

    final Size menuSize = context.getChildSize(0) ?? Size.zero;
    context.paintChild(0,
        transform: Matrix4.translationValues(
            radius - menuSize.width / 2, radius - menuSize.height / 2, 0.0));
  }
}
