import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/custom/hot_widget.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  @override
  Widget build(BuildContext context) {
    //获取当前组件的尺寸
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    // 用Container包裹Scaffold，设置背景图充满
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        // AppBar设置背景色透明，取消阴影
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('样例'),
          centerTitle: false,
        ),
        body: _buildBody(context),
      ),
    );
  }

  Container _buildBody(context) {
    final size = MediaQuery.of(context).size;
    var list = [
      Info(
        color: Colors.blue.shade300,
        title: '掘金列表',
        url: 'juejin_list_item',
      ),
      Info(
        color: Colors.orangeAccent,
        title: '单个聊天',
        url: 'single_chat',
      ),
      Info(
        color: Colors.green.shade300,
        title: '聊天列表',
        url: 'chat_list',
      ),
      Info(
        color: Colors.indigo.shade300,
        title: '图片上传',
        url: 'upload_page',
      ),
      Info(
        color: Colors.pink.shade300,
        title: 'Favorite Page',
        url: 'favorite_page',
      ),
      Info(
        color: Colors.green,
        title: '植物小店展示样例',
        url: 'plant_shop',
      ),
      Info(
        color: Colors.orange,
        title: '时间轴展示样例',
        url: 'timeline',
      ),
      Info(
        color: Colors.pink.shade300,
        title: '我的钱包',
        url: 'wallet',
      ),
      Info(
        color: Colors.green.shade300,
        title: '登录页面样例',
        url: 'login',
      ),
      Info(
        color: Colors.blue,
        title: '自定义滚动视图',
        url: 'custom_scroll',
      ),
      Info(
        color: Colors.indigo.shade300,
        title: '发布通知页面',
        url: 'notice_page',
      ),
      Info(
        color: Colors.red.shade200,
        title: '自定义Clippers',
        url: 'clippers',
      ),
      Info(
        color: Colors.cyan,
        title: 'Lock',
        url: 'lock',
      ),
    ];
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 30),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Colors.white38,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: list
              .map(
                (e) => HotWidget(info: e),
              )
              .toList(),
        ),
      ),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //
      // ),
    );
  }

// return Container(
//   width: size.width,
//   height: size.height,
//   margin: const EdgeInsets.all(12),
//   padding: const EdgeInsets.all(12),
//   decoration: const BoxDecoration(
//     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//     color: Colors.white38,
//   ),
// );
// }
}
