import 'package:core/view/load_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/home/flash_sale.dart' ;

class ViewFlashSale extends StatelessWidget{
  final List<FlashSale> sale;

  const ViewFlashSale({super.key,  required this.sale});

  @override
  Widget build(BuildContext context) {
   return Container(
       decoration: const BoxDecoration(
         color: Colors.white70,
         shape: BoxShape.rectangle,
         borderRadius: BorderRadius.all(Radius.circular(8)),
       ),
       padding: const EdgeInsets.all(16),
       child: getFlashSale(),
   );
  }

  Widget? getFlashSale() {
    return Column(
      children: [
        Row(
          children: [
            const Icon(size: 24, Icons.time_to_leave,),
            const SizedBox(width: 8,),
            const Text("限时精选"),
            const Spacer(), // 占满剩余空间
            const Text("更多"),
            const Icon(size: 24, Icons.arrow_right_sharp,),
          ],
        ),
        const Divider(height: 12,       // 分割线占用的垂直空间
          thickness: 1,     // 线条粗细
          color: Colors.black12, // 线条颜色
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sale.length, // 列表数据数量
              itemBuilder: (context, index){
                var item = sale[index];
                return SizedBox(
                  width: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    LoadImage.load(imageUrl: item.mainPic??""),
                    Text(item.title??""),
                    Text("¥${item.price.toString()}",
                      style: TextStyle(color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,),),
                  ],),
                );
              }
          ),
        )

      ],
    );
  }

}