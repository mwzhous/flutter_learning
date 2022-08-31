import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/bottom/index.dart';
import 'package:flutter_demo/common/routes.dart';

void main() {
  runApp(const MyApp());
  //
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      // 状态栏背景透明
      statusBarColor: Colors.transparent,
      // 底部导航背景色（安全区默认为白色）
      systemNavigationBarColor: Colors.indigo,
      //设置状态栏的图标和字体的颜色: Brightness.light 显示为白色 / Brightness.dark 显示为黑色
      statusBarIconBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      // supportedLocales: const [
      //   Locale('zh', 'zh_CH'),
      //   Locale('en', 'en_US'),
      // ],
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'Flutter学习',
      routes: routes,
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                return const Color(0xff00a89b);
              },
            ),
            foregroundColor: MaterialStateProperty.resolveWith(
              (states) {
                return const Color(0xffffffff);
              },
            ),
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
              (states) {
                return const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      home: const Index(),
    );
  }
}
