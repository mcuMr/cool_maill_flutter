import 'package:flutter/material.dart';

class HomeSearch extends StatefulWidget{
  final ValueChanged onClick;

  const HomeSearch({super.key, required this.onClick,});

  @override
  State<StatefulWidget> createState() {
    return SearchView();
  }
}

class SearchView extends State{

  @override
  Widget build(BuildContext context) {
   return Row(
     children: [
       Icon(
         size: 48,
         Icons.eighteen_up_rating,
       ),
       Expanded( // 使用 Expanded 包裹 Container，解决 Row 宽度无限冲突问题
         child: Container(
           height: 36,
           alignment: Alignment.center,
           decoration: const BoxDecoration(
             color: Colors.white70,
             shape: BoxShape.rectangle,
             borderRadius: BorderRadius.all(Radius.circular(8)),
           ),
           padding: const EdgeInsets.all(8), // 修正为 EdgeInsets.all(8)
           margin: const EdgeInsets.only(left: 16),
           child: const Text(
             '搜索',
             style: TextStyle(color: Colors.black54),
           ),
         ),
       ),
     ],
   );

  }
}