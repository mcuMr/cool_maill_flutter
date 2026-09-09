import 'package:core/network/dio_client.dart';
import 'package:flutter/material.dart';

class MineScreen extends StatefulWidget {
  const MineScreen({super.key});

  @override
  State<MineScreen> createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen> {
    
  @override
  void initState() {
    super.initState();
     print('--------MineScreen initState----');

    // 在这里可以进行一些初始化操作，比如加载用户信息等
    DioClient.instance.get('page/home').then((data) {
      // 处理获取到的用户信息
     print('User profile: $data');
      
    }).catchError((error) {
      // 处理错误
      print('Error fetching user profile: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Mine Screen')));
  }
}
