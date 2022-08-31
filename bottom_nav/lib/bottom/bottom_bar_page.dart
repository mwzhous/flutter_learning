import 'package:bottom_nav/bottom/bottom1/bottom_1_page.dart';
import 'package:bottom_nav/bottom/bottom10/bottom_10_page.dart';
import 'package:bottom_nav/bottom/bottom11/bottom_11_page.dart';
import 'package:bottom_nav/bottom/bottom12/bottom_12_page.dart';
import 'package:bottom_nav/bottom/bottom2/bottom_2_page.dart';
import 'package:bottom_nav/bottom/bottom3/bottom_3_page.dart';
import 'package:bottom_nav/bottom/bottom4/bottom_4_page.dart';
import 'package:bottom_nav/bottom/bottom5/bottom_5_page.dart';
import 'package:bottom_nav/bottom/bottom6/bottom_6_page.dart';
import 'package:bottom_nav/bottom/bottom7/bottom_7_page.dart';
import 'package:bottom_nav/bottom/bottom8/bottom_8_page.dart';
import 'package:bottom_nav/bottom/bottom9/bottom_9_page.dart';
import 'package:flutter/material.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  BottomBarPageState createState() => BottomBarPageState();
}

class BottomBarPageState extends State<BottomBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Bar'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => push(const Bottom1Page()),
                child: const Text('1-右侧展开菜单'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => push(const Bottom2Page()),
                child: const Text('2-山峦起伏菜单'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => push(const Bottom3Page()),
                child: const Text('3-仿B站底部菜单 '),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => push(const Bottom4page()),
                child: const Text('4-中间凹进去的菜单'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => push(const Bottom5Page()),
                child: const Text('5-半折扇菜单'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => push(const Bottom6Page()),
                child: const Text('6-Flutter自带菜单'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => push(const Bottom7Page()),
                child: const Text('7-圆圈圈菜单'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => push(const Bottom8Page()),
                child: const Text('8-向上展开菜单'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => push(const Bottom9Page()),
                child: const Text('9-仿抖音、小红书菜单'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => push(const Bottom10Page()),
                child: const Text('10-圆圈圈圈菜单'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => push(const Bottom11Page()),
                child: const Text('11-拉面菜单'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => push(const Bottom12Page()),
                child: const Text('12-salomon底部菜单'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  push(page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
