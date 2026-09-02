import 'package:cool_mail/app/router/route_name.dart';
import 'package:cool_mail/features/splash/splash_screen.dart';
import 'package:cool_mail/features/main/main_screen.dart';
import 'package:cool_mail/features/home/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: splashScreen,
  routes: [

    // 闪屏页
    GoRoute(
      path: splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),

    // 主页面
    GoRoute(
      path: mainScreen, 
      builder: (context, state) => const MainScreen()
    ),

    // 首页
    GoRoute(
      path: homeScreen,
      builder: (context, state) => const HomeScreen(),
    ),

    




  ],
);