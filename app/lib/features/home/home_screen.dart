import 'package:core/api/api_home.dart';
import 'package:core/model/home/model_home.dart';
import 'package:core/view/view_banner.dart';
import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        
          Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.rectangle,
            ),
            child: const Text('Home Screen', style: TextStyle(fontSize: 24)),
          ),

          SizedBox(height: 16,),

          ViewBanner(
            banners: _result?.banner ?? [],
            onImageTap: (index) {
              print('点击了第 ${index + 1} 张图片');
            },
          )

        ],
      ),
    );
  }
}
