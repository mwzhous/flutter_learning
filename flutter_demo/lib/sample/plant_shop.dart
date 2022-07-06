import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/custom/card_widget.dart';

const Color darkBlue = Color(0xFF44956c);

class PlantShop extends StatelessWidget {
  const PlantShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: darkBlue,
          centerTitle: false,
          actions: const <Widget>[
            Icon(Icons.code),
          ],
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Stack(
                  children: <Widget>[
                    ClipPath(
                      clipper: BottomClipper(),
                      child: Container(
                        color: darkBlue,
                        height: 230,
                      ),
                    ),
                    Positioned(
                      left: 18.0,
                      top: 20.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          SizedBox(
                            width: 280,
                            child: Text(
                              "Hi 小鹿扫描！",
                              textScaleFactor: 1.5,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: CircleAvatar(
                              backgroundImage: AssetImage("images/avatar.jpg"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 160,
                      left: 18.0,
                      child: Container(
                          width: 350,
                          height: 60,
                          padding: const EdgeInsets.all(15.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 50,
                                color: Color(0x5544956c),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Search",
                                style: TextStyle(
                                  color: Color(0x7744956c),
                                  fontSize: 20.0,
                                  height: 1.2,
                                ),
                              ),
                              Icon(
                                Icons.search,
                                size: 30,
                                color: Color(0x9944956c),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.fromLTRB(
                                    0.0, 15.0, 0.0, 0.0),
                                height: 15,
                                width: 100,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFcfe5dd), // 底色
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.elliptical(20, 50)),
                                ),
                              ),
                              const Text(
                                "热门推荐",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 110,
                            height: 45,
                            padding: const EdgeInsets.all(5.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: darkBlue,
                            ),
                            child: GestureDetector(
                              child: const Text(
                                '更多',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              onLongPress: () {
                                Navigator.pushNamed(context, '/progress');
                              },
                            ),
                          ),
                        ],
                      ),
                      _buildScrollView(context)
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.fromLTRB(
                                    0.0, 15.0, 0.0, 0.0),
                                height: 15,
                                width: 100,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFcfe5dd), // 底色
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.elliptical(20, 50)),
                                ),
                              ),
                              const Text(
                                "特色植物",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 110,
                            height: 45,
                            padding: const EdgeInsets.all(5.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: darkBlue,
                            ),
                            child: GestureDetector(
                              child: const Text(
                                '更多',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              onLongPress: () {
                                Navigator.pushNamed(context, '/progress');
                              },
                            ),
                          ),
                        ],
                      ),
                      _buildScrollView(context)
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }

  // 构建水平滚动视图
  SingleChildScrollView _buildScrollView(context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const <Widget>[
          RecommendPlantCard(
            image: "images/p1.png",
            title: '兰花',
            country: '中国',
            price: 440,
          ),
          RecommendPlantCard(
            image: "images/p2.png",
            title: '当归',
            country: '中国',
            price: 440,
          ),
          RecommendPlantCard(
            image: "images/p3.png",
            title: '萨曼沙',
            country: '俄罗斯',
            price: 440,
          ),
        ],
      ),
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0); //第一个点
    path.lineTo(0, size.height - 60); //第二个点
    var firstControlPoint = Offset(size.width / 2, size.height); //曲线开始点
    var firstEndPoint = Offset(size.width, size.height - 60); // 曲线结束点
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, size.height - 60); //第四个点
    path.lineTo(size.width, 0); // 第五个点
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
