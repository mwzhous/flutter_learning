import 'package:flutter/material.dart';
import 'package:flutter_demo/common/iconfont.dart';
import 'package:flutter_demo/common/style.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('各类图标组件'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Icon',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '用于图标显示的组件，可指定图标资源、大小、颜色、简单实用。',
                  style: descStyle,
                ),
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const <Widget>[
                  Icon(
                    Icons.send,
                    color: Colors.orange,
                    size: 50,
                  ),
                  Icon(
                    Icons.android,
                    color: Colors.green,
                    size: 100,
                  ),
                  Icon(
                    IconFont.icon_calendar,
                    color: Colors.blue,
                    size: 60,
                  )
                ],
              ),
              const Text(
                'IconButton',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '可点击的图标按钮，可指定图标信息、内边距、大小、颜色等，接受点击事件。',
                  style: descStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                  padding: const EdgeInsets.only(),
                  onPressed: () {},
                  icon: const Icon(
                      Icons.camera,
                      size: 50,
                      color: Colors.green
                  ),
                  // 长按提示文字
                  tooltip: 'camera',
                  // 长按高亮色
                  highlightColor: Colors.orange,
                  // 水波纹颜色
                  splashColor: Colors.blue,
                ),
              ),
              const Text(
                'AnimatedIcon',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '根据动画控制器来使图标获得动画效果，可指定图标大小、颜色等。',
                  style: descStyle,
                ),
              ),
              Test(),
            ],
          ),
        ),
      ),
    );
  }
}

class Test extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestState();
}

class _TestState extends State<Test> with TickerProviderStateMixin{
  late AnimationController animationContainer;

  @override
  void initState() {
    super.initState();
    animationContainer =
      AnimationController(duration: Duration(seconds: 1), vsync: this)
        ..addStatusListener((AnimationStatus status) {
          if (status == AnimationStatus.completed) {
            animationContainer.reverse();
          }
        }
      );
    animationContainer.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      alignment: Alignment.center,
      child: AnimatedIcon(
        icon: AnimatedIcons.view_list,
        progress: animationContainer,
        color: Colors.blue,
        size: 50,
      ),
    );
  }

  @override
  dispose() {
      super.dispose();
      animationContainer.dispose();
  }
}

