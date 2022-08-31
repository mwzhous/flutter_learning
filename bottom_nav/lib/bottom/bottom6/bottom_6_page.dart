import 'package:bottom_nav/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

/// flutter 自带菜单 仿咸鱼
class Bottom6Page extends StatefulWidget {
  const Bottom6Page({Key? key}) : super(key: key);

  @override
  Bottom6PageState createState() => Bottom6PageState();
}

class Bottom6PageState extends State<Bottom6Page> {
  int pageIndex = 0;
  FloatingActionButtonLocation location =
      FloatingActionButtonLocation.startDocked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Flutter 自带菜单',
        backgroundColor: Colors.pink.shade300,
      ),
      floatingActionButton: FloatingActionButton(
        // 浮动交互按钮
        onPressed: () => debugPrint('点击了添加'),
        heroTag: 'home_bottom_navigator',
        tooltip: '添加',
        //长按提示
        backgroundColor: const Color(0xfff3799c),
        //背景颜色
        foregroundColor: Colors.white,
        elevation: 4,
        child: const Icon(Icons.add),
      ),
      // 融合底部工具栏
      floatingActionButtonLocation: location,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 8,
        // 圆形缺口  和  FloatingActionButtonLocation融合
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            space(location == FloatingActionButtonLocation.startDocked),

            Expanded(
              child: IconButton(
                icon: const Icon(Icons.access_alarm_outlined),
                iconSize: 32,
                color: pageIndex == 0 ? const Color(0xfff3799c) : Colors.grey,
                onPressed: () => onClickBottomBar(0),
              ),
            ),
            // if (location == FloatingActionButtonLocation.centerDocked)
            //   SizedBox(),

            space(location == FloatingActionButtonLocation.centerDocked),
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.where_to_vote_rounded),
                iconSize: 32,
                color: pageIndex == 1 ? const Color(0xfff3799c) : Colors.grey,
                onPressed: () => onClickBottomBar(1),
              ),
            ),
            space(location == FloatingActionButtonLocation.endDocked),
          ],
        ),
      ),
      body: content(),
      backgroundColor: Colors.grey[100],
    );
  }

  Widget space(bool show) {
    return AnimatedContainer(
      width: show ? 80 : 0,
      height: 0,
      duration: const Duration(milliseconds: 250),
    );
  }

  Widget content() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(pageIndex.toString(),
              style: TextStyle(color: Colors.grey[400], fontSize: 80)),
          GestureDetector(
            onTap: () {
              setState(() {
                if (location == FloatingActionButtonLocation.startDocked) {
                  location = FloatingActionButtonLocation.centerDocked;
                } else if (location ==
                    FloatingActionButtonLocation.centerDocked) {
                  location = FloatingActionButtonLocation.endDocked;
                } else {
                  location = FloatingActionButtonLocation.startDocked;
                }
              });
            },
            child: const Chip(
              label: Text('更换按钮位置'),
              backgroundColor: Color(0xfff3799c),
              avatar: Icon(Icons.cached, color: Colors.white),
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void onClickBottomBar(int page) {
    setState(() => pageIndex = page);
  }
}
