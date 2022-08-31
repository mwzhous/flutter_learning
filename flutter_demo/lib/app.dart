import 'package:flutter/material.dart';
import 'package:flutter_demo/bottom/sample_page.dart';
import 'package:flutter_demo/common/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Tabs(),
    );
  }
}

class Tabs extends StatefulWidget {
  final index;
  Tabs({Key? key, this.index = 0}) : super(key: key);

  @override
  _TabsState createState() => _TabsState(index: this.index);
}

class _TabsState extends State<Tabs> {
  int index = 0;
  _TabsState({this.index = 0});
  List _page = [
    Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        centerTitle: true,
      ),
    ),
    SamplePage(),
    Scaffold(
      appBar: AppBar(
        title: Text("我的"),
        centerTitle: true,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        child: FloatingActionButton(
          hoverColor: Colors.green,
          highlightElevation: 10,
          elevation: 5,
          child: Icon(
            Icons.share,
            size: 30,
          ),
          //事件导航
          onPressed: () {
            setState(() {
              this.index = 1;
            });
          },
          backgroundColor:
              this.index == 1 ? Colors.red.shade400 : Colors.indigo.shade400,
        ),
        height: 55,
        width: 55,
        // padding: EdgeInsets.all(8),
        // margin: EdgeInsets.only(top: 10),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.only(
        //     bottomLeft: Radius.circular(10),
        //     bottomRight: Radius.circular(10),
        //   ),
        //   // color: Colors.white,
        // ),
      ),
      //设置按钮位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: _page[this.index],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.indigo,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "首页",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              // color: Colors.transparent,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "我的",
          )
        ],
        currentIndex: this.index, //选中的底部bar索引
        fixedColor: Colors.white, //选中的颜色
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        }, //点击bar回调,必须传入index参数,bar的索引
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[],
      ),
    );
  }
}
