import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/*
class KnowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
      body: Center(
        child: new Text("首页"),
      ),
    );
  }
    var dio=Dio();
  void getHttp() async{
    try{
      Response response = await Dio().get("https://www.wanandroid.com/banner/json");
      print("zyy"+response.data.toString());
    }catch(e){
   return  print(e);
    }
  }*/
class KnowPage extends StatefulWidget {

  @override
  _AdBannerState createState() => _AdBannerState();
}

class _AdBannerState extends State<KnowPage> {
  String showText="没有数据";


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title:new Text("蓝胖子") ,backgroundColor: Colors.purple),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed:_jike,
                child: Text("222"),
              ),
              Text(showText)
            ],
          ),
        ),


      ),

    );
  }
  void _jike(){
    print("");
    getHttp().then((val){
      setState(() {
        showText=val["data"].toString();
      });
    });

  }





  Future getHttp() async{
    try {
      Dio dio=new Dio();
      Response response;
      response=await dio.get("https://www.wanandroid.com/banner/json");
      print(response.toString());
      return response.data;
    } catch (e) {
      print(e);
    }

  }
}


