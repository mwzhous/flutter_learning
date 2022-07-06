import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '对话框',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '最简易的对话框面板，包含一个内容组件，可指定影深、背景色、形状等属性',
                  style: descStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
