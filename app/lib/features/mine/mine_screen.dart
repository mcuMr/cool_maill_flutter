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
    return Scaffold(
      body: Center(child: Text(_result?.toString() ?? 'No data available')),
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
}
