import 'package:core/api/api_home.dart';
import 'package:core/model/home/model_home.dart';
import 'package:flutter/material.dart';

class MineScreen extends StatefulWidget {
  const MineScreen({super.key});

  @override
  State<MineScreen> createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen> {
  ModelHome? _result; 

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding:  EdgeInsets.all(16.0),
        child: Scaffold(
            body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 16.0,
                children: [
                    // 用户信息
                    userInfoSection(),

                    userInfoSection(),

                    userInfoSection(),

                ],
            ),
            ),
    );
  }

  Future<void> _loadData() async {
    final apiService = ApiHome();

    final data = await apiService.getUser();

    if (!mounted) return;

    setState(() {
      _result = data.data;
    });
  }

  Widget userInfoSection(){
   return Row(
        children: [
            Icon( Icons.on_device_training,),
            Column(children: [
                Text("UserName "),
                Text("UserName 1")
            ],),
            Icon( Icons.arrow_right_alt,),
        ],
    );
  }
}

