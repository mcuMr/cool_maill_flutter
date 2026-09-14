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
        body: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset('images/ic_logo.png', width: 160, height: 160),
              // SvgPicture.asset(
              //   'images/ic_logo.xml',
              //   width: 200,
              //   height: 200,
              //   semanticsLabel: 'Dart Logo',
              // ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text(
                "CoolMail",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
