import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bbbb/bean/bannerbean.dart';
import 'package:flutter_bbbb/bean/shouyelistbean.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CollectPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<CollectPage> {
  var list = List();
  List<DataX> datas = List();
  bool isLoading = true;
  int page = 0;
  ScrollController _scrollController = ScrollController(); //listViewK控制器

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBanner();
    getArtical(page);
    //滑动的监听
    _scrollController.addListener(() {
      //判断是否滑到了底部
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑到了底部');
        //滑到了底部，加载更多
        _getMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('收藏'),
        ),
        body: RefreshIndicator(
          color: Colors.deepPurple,
          onRefresh: _onRefresh,
          child: ListView.builder(
            itemCount: datas.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return getBannerWeight();
              }
              if (index < datas.length) {
                return getArticle(index - 1);
              } else {
                return _getMoreWidget();
              }
            },
            controller: _scrollController,
          ),
        ));
  }



  void getBanner() async {
    await Dio().get("https://www.wanandroid.com/banner/json").then((value) {
      var decode = json.decode(value.toString());
      print(decode.toString());
      var homeBannerBean = BannerBean.fromJson(decode);
      setState(() {
        this.list.addAll(homeBannerBean.data);
        isLoading = false;
      });
    });
  }

  void getArtical(int page) async {
    await Dio()
        .get('https://www.wanandroid.com/article/list/$page/json')
        .then((value) {
      var decode = json.decode(value.toString());
      print(decode.toString());
      setState(() {
        var homeArticleBean = ShouListBean.fromJson(decode);
        datas.addAll(homeArticleBean.data.datas);
        isLoading=true;
      });
    });
  }

  Widget getBannerWeight() {
    return SizedBox(
      height: 180.0,
      child: list.length == 0
          ? _buildProgressIndicator()
          : Swiper(
        itemCount: list.length,
        autoplay: true,
        itemBuilder: (context, intex) {
          var list1 = list[intex] as DataBan;
          return Image.network(
            list1.imagePath,
            fit: BoxFit.fill,
          );
        },
        scrollDirection: Axis.horizontal,
        pagination: SwiperPagination(),
      ),
    );
  }

  _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget getArticle(index) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(1),
                  child: Row(
                    children: <Widget>[
                      Text('${datas[index].shareUser}'),
                      Text(
                        '${datas[index].shareDate}',
                        textAlign: TextAlign.center,
                      )
                    ],
                  )),
            ],
          ),
          Container(child: Text('${datas[index].title}', maxLines: 1)),
          Container(
              child: Text(
                '${datas[index].superChapterName}',
                maxLines: 1,
                textAlign: TextAlign.left,
              )),
        ],
      ),
    );
  }

  ///刷新方法
  Future _onRefresh() async {
    page = 0;
    await Future.delayed(Duration(seconds: 2), () {
      print('refresh');
      setState(() {
        list.clear();
        datas.clear();
        getBanner();
        getArtical(page);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  ///上拉加载更多
  void _getMore() async {
    await Future.delayed(Duration(seconds: 2), () {
      page++;
      getArtical(page);
    });
  }

  /// 加载更多时显示的组件,给用户提示
  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中...',
              //文字风格
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }
}
