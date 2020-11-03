import 'dart:convert' as converthj;


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bbbb/bean/bannerbean.dart';
import 'package:flutter_bbbb/bean/shouyelistbean.dart';
import 'package:flutter_bbbb/pages/home_page.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;

//class CartPage extends StatefulWidget {
//  @override
//  _CartPageState createState() => _CartPageState();
//}
//
//class _CartPageState extends State<CartPage> {
//  var list = List();
//  bool isLoading=true;
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: new Text("首页"),
//
//      ),
//    );
//  }
//  @override
//  void initState() {
//    // TODO: implement initState
// //   getBanner();
//
//    super.initState();
//  }
//
//  void getBanner() async {
//    await Dio().get("https://www.wanandroid.com/banner/json").then((value) {
//      var decode = json.decode(value.toString());
//      print(decode.toString());
//      var homeBannerBean = BannerBean.fromJson(decode);
//      setState(() {
//        this.list.addAll(homeBannerBean.data);
//        isLoading = false;
//      });
//    });
//  }
//
//  Widget getBannerWeight() {
//    return SizedBox(
//      height: 180.0,
//      child: Swiper(
//        itemCount: list.length,
//        autoplay: true,
//        itemBuilder: (context, intex) {
//          var list1 = list[intex] as DataBan;
//          return Image.network(
//            list1.imagePath,
//            fit: BoxFit.fill,
//          );
//        },
//        scrollDirection: Axis.horizontal,
//
//      ),
//    );
//  }
//}
class CartPage extends StatefulWidget {
  
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List list=[];
  @override
  Widget build(BuildContext context) {
    return Container();
  }

@override
  void initState() {
    // TODO: implement initState
  GetListBen();
    super.initState();
  }

  void GetListBen() async{
    Response response;
   try{
     var response2 = await http.get("	http://www.wanandroid.com/banner/json");




   }catch(e){}
  }
}






