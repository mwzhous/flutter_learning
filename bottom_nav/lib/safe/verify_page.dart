import 'package:bottom_nav/safe/safe_verify.dart';
import 'package:flutter/material.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  VerifyPageState createState() => VerifyPageState();
}

class VerifyPageState extends State<VerifyPage> {
  bool success = false;

  @override
  Widget build(BuildContext context) {
    /// 禁用侧滑
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).userGestureInProgress) {
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('安全验证'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text('为了你的账号安全，本次登录需要进行验证'),
              const Text('请将下方的图标移动到圆形区域内'),
              const SizedBox(height: 30),
              Expanded(
                child: DemoVerity(lister: (state) {
                  debugPrint('返回状态>>> $state');
                  if (state) {
                    Navigator.pop(context, true);
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
