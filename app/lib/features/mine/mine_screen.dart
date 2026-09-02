import 'package:flutter/material.dart';

class MineScreen extends StatefulWidget {
  const MineScreen({super.key});


  @override
  State<MineScreen> createState() => _MineScreenState();
}



class _MineScreenState extends State<MineScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Mine Screen'),
      ),
    );
  }

}