import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './pages/tab_page.dart';

void main() {
  runApp(MyApp(
      // items2222:List<String>.generate(50, (i) => 'Item $i')
      ));

  var dio=Dio();
}

class MyApp extends StatelessWidget {
  ///MyApp({Key key,this.title }):super
  // final List<String> items2222;
  // MyApp({Key key,@required this.items2222}):super(key:key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'zyy',
      home: Scaffold(
        appBar: AppBar(title: Text('listView'), backgroundColor: Colors.purple),
        body: MyHomePage(),
      ),
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//      ),
    );
  }
}

