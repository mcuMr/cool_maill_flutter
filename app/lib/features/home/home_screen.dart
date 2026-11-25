import 'package:core/api/api_home.dart';
import 'package:core/model/home/model_home.dart';
import 'package:core/view/view_banner.dart';
import 'package:core/view/view_home_search.dart';
import 'package:core/view/view_category.dart';
import 'package:core/view/view_all_shop.dart';
import 'package:core/view/view_flash_sale.dart';
import 'package:core/view/view_notice_marquee.dart';
import 'package:core/view/view_title.dart';
import 'package:core/view/view_recommend.dart';
import 'package:flutter/material.dart' hide Title;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ModelHome? _result;

  @override
  void initState() {
    super.initState();
    _fetchData(); // 页面初始化时只请求一次
  }

  Future<void> _fetchData() async {
    final apiService = ApiHome();

    final data = await apiService.getUser();

    if (!mounted) return;

    setState(() {
      _result = data.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeSearch(onClick: (value) {
                print('跳转到搜索页面');
              },),

                // 轮播图
              SizedBox(height: 16,),
              ViewBanner(
                banners: _result?.banner ?? [],
                onImageTap: (index) {
                  print('点击了第 ${index + 1} 张图片');
                },
              ),

            // 跑马灯
              SizedBox(height: 16,),
              ViewNoticeMarquee(notices: _result?.coupon??[],),

            // 品类
              SizedBox(height: 16,),
              ViewCategory(
                categoryAll : _result?.category??[],
                onItemTap: (data){
                  print('跳转 ${data.name} ');
                },
              ),

            // 限时精选     
              SizedBox(height: 16,),
              ViewFlashSale(sale:_result?.flashSale??[]),

            // 推荐商品
              SizedBox(height: 16),
              SubTitle(title: '推荐商品',),
              SizedBox(height: 8),
              ViewRecommend(recommend:_result?.recommend??[]),

            // 全部商品
              SizedBox(height: 16),
              SubTitle(title: '全部商品',),
              SizedBox(height: 8),
              ViewAllShop(shopAll:_result?.goods??[])
            ],
          ),
        )
      )
    );
  }
}
