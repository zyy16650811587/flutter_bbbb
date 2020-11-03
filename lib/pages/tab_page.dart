import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'know_page.dart';
import 'collect_page.dart';
import 'cart_page.dart';

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  final List<BottomNavigationBarItem> bottom = [
    BottomNavigationBarItem(icon: Icon(Icons.slideshow), title: Text("首页")),
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("知识")),
    BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart), title: Text("购物车")),
    BottomNavigationBarItem(icon: Icon(Icons.collections), title: Text("收藏")),
  ];
  final List tabBodes = [
    HomePage(),
    CartPage(),
    KnowPage(),
    CollectPage(),
  ];

  int currentIndex = 0;
  var currentPage;


//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//  }

  @override
  void initState() {
    currentPage = tabBodes[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(200, 200, 200, 1),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottom,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodes[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}