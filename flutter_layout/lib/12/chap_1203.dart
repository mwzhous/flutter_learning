import 'package:flutter/material.dart';

class Chap1203 extends StatelessWidget {
  const Chap1203({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('03: 案例优化: 折叠时不绘制重叠子级、居中显示'),
      ),
      body: const Center(
        child: FlowMenu(),
      ),
    );
  }
}

class FlowMenu extends StatefulWidget {
  const FlowMenu({Key? key}) : super(key: key);

  @override
  State<FlowMenu> createState() => _FlowMenuState();
}

class _FlowMenuState extends State<FlowMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController menuAnimation;
  IconData lastTapped = Icons.notifications;
  final List<IconData> menuItems = <IconData>[
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];

  void _updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      setState(() => lastTapped = icon);
    }
  }

  @override
  void initState() {
    super.initState();
    menuAnimation = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
  }

  Widget flowMenuItem(IconData icon) {
    const double buttonDiameter = 40;
    return RawMaterialButton(
      fillColor: lastTapped == icon ? Colors.amber[700] : Colors.blue,
      splashColor: Colors.amber[100],
      shape: const CircleBorder(),
      constraints:
          BoxConstraints.tight(const Size(buttonDiameter, buttonDiameter)),
      onPressed: () {
        _updateMenu(icon);
        menuAnimation.status == AnimationStatus.completed
            ? menuAnimation.reverse()
            : menuAnimation.forward();
      },
      child: Icon(
        icon,
        color: Colors.white,
        size: 24.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowMenuDelegate(menuAnimation: menuAnimation),
      children:
          menuItems.map<Widget>((IconData icon) => flowMenuItem(icon)).toList(),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({required this.menuAnimation})
      : super(repaint: menuAnimation);

  final Animation<double> menuAnimation;

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0.0;
    double dy = 0.0;
    if (menuAnimation.value == 0) {
      dy = (context.size.height -
              context.getChildSize(context.childCount - 1)!.height) /
          2;
      context.paintChild(
        context.childCount - 1,
        transform: Matrix4.translationValues(
          dx,
          dy,
          0,
        ),
      );
    } else {
      for (int i = 0; i < context.childCount; ++i) {
        dx = context.getChildSize(i)!.width * i;
        dy = (context.size.height - context.getChildSize(i)!.height) / 2;
        context.paintChild(
          i,
          transform: Matrix4.translationValues(
            dx * menuAnimation.value,
            dy,
            0,
          ),
        );
      }
    }
  }
}
