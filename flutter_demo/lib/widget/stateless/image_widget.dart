import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('图片组件'),
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            // SizedBox(
            //   width: 120,
            //   height: 120,
            //   child: Image.network(
            //       'https://avatars.githubusercontent.com/u/59445871?s=400&u=da5694544e03959d2e2c54ea5b2a29c67174cbcc&v=4'),
            // ),
            Image.asset(
              "images/avatar.jpg",
              width: 100.0,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
            ),
            const Image(
              image: AssetImage("images/avatar.jpg"),
              width: 100.0,
              height: 200.0,
              repeat: ImageRepeat.repeatY,
            ),
            const Image(
              image: NetworkImage(
                  "https://avatars.githubusercontent.com/u/59445871?s=400&u=da5694544e03959d2e2c54ea5b2a29c67174cbcc&v=4"),
              width: 100.0,
            ),
            Image.network(
              "https://avatars.githubusercontent.com/u/59445871?s=400&u=da5694544e03959d2e2c54ea5b2a29c67174cbcc&v=4",
              width: 100.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.accessible, color: Colors.green),
                Icon(Icons.error, color: Colors.green),
                Icon(Icons.fingerprint, color: Colors.green),
                Icon(MyIcons.book, color: Colors.purple),
                Icon(MyIcons.wechat, color: Colors.green),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyIcons {
  // book 图标
  static const IconData book =
      const IconData(0xe62c, fontFamily: 'myIcon', matchTextDirection: true);

  // 微信图标
  static const IconData wechat =
      const IconData(0xe995, fontFamily: 'myIcon', matchTextDirection: true);
}
