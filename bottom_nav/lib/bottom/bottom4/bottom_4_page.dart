import 'package:bottom_nav/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

import 'bottom_app_bar_4.dart';
import 'tabIcon_data.dart';

class Bottom4page extends StatefulWidget {
  const Bottom4page({Key? key}) : super(key: key);

  @override
  Bottom4pageState createState() => Bottom4pageState();
}

class Bottom4pageState extends State<Bottom4page> {
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '中间凹进去的菜单',
        backgroundColor: Colors.indigo.shade400,
      ),
      body: Stack(
        children: [
          content(),
          bottomBar(),
        ],
      ),
    );
  }

  Widget content() {
    return Positioned.fill(
      child: Container(
        alignment: Alignment.center,
        child: Text(pageIndex.toString(),
            style: TextStyle(color: Colors.grey[400], fontSize: 80)),
      ),
    );
  }

  Widget bottomBar() {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: BottomAppBar4(
          tabIconsList: tabIconsList,
          centerClick: () {
            // 按钮动画结束之后
            debugPrint('点击了中间按钮');
          },
          changeIndex: (index) => onClickBottomBar(index),
        ));
  }

  void onClickBottomBar(int index) {
    if (!mounted) return;

    setState(() => pageIndex = index);
  }
}
