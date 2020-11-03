import 'dart:convert';



import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_swiper/flutter_swiper.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
          appBar: AppBar(
            title: new Text("首页"), backgroundColor: Colors.black26,),

          body: FutureBuilder(
            future: getHttp(),
            builder: (context, snapshot) {
              print(snapshot.toString() + "11111");
              print(snapshot.hasData);
              ;
              if (!snapshot.hasData) {
                var data = json.decode(snapshot.data.toString());

                List<Map> swiper2 = (data['data']['imagePath'] as List).cast();
                print(swiper2.toString() + ",");
                return Column(
                  children: <Widget>[

                    //                  SwiperDiy(swiperDataList: swiper2)

                    getHomeWidget(swiper2)
                  ],
                );
              } else {
                return Center(

                );
              }
            },
          )

      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future getHttp() async {
    try {
      Dio dio = new Dio();
      Response response;
//       response=await dio.get("https://www.wanandroid.com/banner/json").then((value) {
//         json.decode(value.toString());
//         return response.data;
//       }
//       );
      response = await dio.get("https://www.wanandroid.com/banner/json");
//       print(response.toString());
      return response.data;
    } catch (e) {
      print(e);
    }
  }

//首页
  Widget getHomeWidget(List<Map> swiper2) {
    print(swiper2.toString() + "11111");
    print("s11111");
    var swiperDataList;
    return Container(
      height: 300,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network("${swiper2[index]["images"]}");
        },
        itemCount: swiper2.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }

}



