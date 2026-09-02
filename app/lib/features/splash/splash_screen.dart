import 'package:cool_mail/app/router/route_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // 等待2秒后跳转到主页
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.go(mainScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () {
              context.go(mainScreen);
            },
            child: const Text('进入主页'),
          ),
        ),
      ),
    );
  }
}