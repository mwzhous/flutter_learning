// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

const greenColor = Color(0xFF0C9869);

class PlantShop extends StatelessWidget {
  const PlantShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 构建脚手架，包含顶部appBar和body
    return Scaffold(
        appBar: _buildAppBar(context),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: _buildHeader(),
            ),
            Positioned(
              top: 130,
              left: 20,
              right: 20,
              child: _buildSearch(),
            ),
            Positioned(
              top: 200,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height - 200,
              child: const Body(),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.local_florist),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.person_outline),
                onPressed: () {},
              ),
            ], //均分底部导航栏横向空间
          ),
        ));
  }

  // 构建顶部Header
  Container _buildHeader() {
    // banner中的字体
    const style = TextStyle(
      color: Colors.white,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    );
    return Container(
      // 通过内边距让文字上移
      padding: const EdgeInsets.only(
        bottom: 50,
      ),
      height: 160,
      decoration: const BoxDecoration(
        color: greenColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Row(
        // 主轴会让交叉轴的对齐方式
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          // Row布局，左文右图
          Text(
            'Hi 小鹿扫描！',
            style: style,
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'images/banner.jpeg',
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 构建搜索区
  Container _buildSearch() {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1.0, color: greenColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: const TextField(
        autofocus: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: greenColor,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: 20,
            color: greenColor,
          ),
        ),
      ),
    );
  }

  // 构建顶部appBar的私有方法
  AppBar _buildAppBar(context) {
    return AppBar(
      elevation: 0,
      backgroundColor: greenColor,
      actions: const [
        Icon(
          Icons.code,
          color: Colors.white,
        ),
      ],
      // leading:
    );
  }
}

// 自定义裁剪路径，通过贝塞尔曲线构建弧形
class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0); //第一个点
    path.lineTo(0, size.height - 60); //第二个点
    var firstControlPoint = Offset(size.width / 2, size.height); //曲线开始点
    var firstEndPoint = Offset(size.width, size.height - 60); //曲线结束点
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, size.height - 60); //第四个点
    path.lineTo(size.width, 0); //第五个点
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

// Body类构建
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 标题文字
    var titleStyle = const TextStyle(
      color: Colors.black87,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
    );
    //纵向滚动视图，两部分组成：热门推荐和特色植物
    return SingleChildScrollView(
      // 纵向 + Column布局
      scrollDirection: Axis.vertical,
      child: Column(
        // 水平方向（交叉轴）左对齐
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '热门推荐',
                  style: titleStyle,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: greenColor,
                  ),
                  child: const Text('更多'),
                ),
              ],
            ),
          ),
          // RecommendsPlants类，⽤于构建横向滚动的热⻔推荐区域
          const RecommendsPlants(),
          Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '特色植物',
                  style: titleStyle,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF0C9869),
                  ),
                  child: const Text('更多'),
                ),
              ],
            ),
          ),
          // FeaturesPlants类，用于构建纵向滚动的特色植物区域
          const FeaturedPlants(),
          //const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

// 构建热门推荐
class RecommendsPlants extends StatelessWidget {
  const RecommendsPlants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 水平滚动视图
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const <Widget>[
            // 调用封装的自定义组件，传入参数值
            RecommendPlantCard(
              image: "images/junzilan.png",
              title: '君子兰',
              country: '中国',
              price: 440,
            ),
            RecommendPlantCard(
              image: "images/junzilan.png",
              title: '当归',
              country: '中国',
              price: 440,
            ),
            RecommendPlantCard(
              image: "images/junzilan.png",
              title: '沙拉曼',
              country: '俄罗斯',
              price: 440,
            ),
          ],
        ));
  }
}

class RecommendPlantCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const RecommendPlantCard({
    required this.image,
    required this.title,
    required this.country,
    required this.price,
  });

  final String image, title, country;
  final int price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            fit: BoxFit.fill,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: Colors.indigo,
                  // color: Colors.indigo.withOpacity(0.66),
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      title.toString(),
                      style: Theme.of(context).textTheme.button,
                    ),
                    Text(
                      country.toString(),
                      style: TextStyle(
                        color: Colors.indigo.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  price.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(color: Colors.green),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 构建特色植物区域
class FeaturedPlants extends StatelessWidget {
  const FeaturedPlants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
          // 调用封装的自定义组件，传入图片地址
          FeaturePlantCard(
            image: 'images/plant.png',
          ),
          FeaturePlantCard(
            image: 'images/plant.png',
          ),
          FeaturePlantCard(
            image: 'images/plant.png',
          ),
        ],
      ),
    );
  }
}

// 自定义类，定义图片地址，使用卡片构建
class FeaturePlantCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const FeaturePlantCard({
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(10),
      height: 240,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(image),
          )),
    );
  }
}
