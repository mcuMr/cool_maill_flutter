import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget{
  final String title;
  const SubTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
   return Row(
      children: [
        Icon( size: 12, Icons.time_to_leave),
        SizedBox(width: 8,),
        Text(title),
      ],
    );
  }

}