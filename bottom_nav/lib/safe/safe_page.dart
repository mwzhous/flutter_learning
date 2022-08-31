import 'package:bottom_nav/safe/verify_page.dart';
import 'package:flutter/material.dart';

class SafePage extends StatefulWidget {
  const SafePage({Key? key}) : super(key: key);

  @override
  SafePageState createState() => SafePageState();
}

class SafePageState extends State<SafePage> {
  bool success = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('拖动验证器'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('验证码返回结果：$success'),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VerifyPage()),
                );
                if (result == null) {
                  debugPrint('longer   返回结果为 >>> null');
                  return;
                }
                if (result != success) {
                  setState(() {
                    success = result;
                  });
                }
              },
              child: const Text('登录'),
            )
          ],
        ),
      ),
    );
  }
}
