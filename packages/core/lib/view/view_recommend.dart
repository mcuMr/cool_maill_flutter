import 'package:core/view/load_image.dart';
import 'package:flutter/material.dart';

import '../model/home/recommend.dart' ;

class ViewRecommend extends StatelessWidget{
  final List<Recommend> recommend;

  const ViewRecommend({super.key,  required this.recommend});

  @override
  Widget build(BuildContext context) {
   return Container(
       decoration: const BoxDecoration(
         color: Colors.white70,
         shape: BoxShape.rectangle,
         borderRadius: BorderRadius.all(Radius.circular(8)),
       ),
       padding: const EdgeInsets.all(16),
       child: getRecommend(),
   );
  }

  Widget getRecommend() {
    return ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: recommend.length, // 列表数据数量
              separatorBuilder: (context, index) => const Divider(height: 16,color: Colors.black12,),
              itemBuilder: (context, index){
                var item = recommend[index];
                return SizedBox(
                  height: 120,
                  child: Row(
                    spacing: 12,
                    children: [
                      LoadImage.load(imageUrl: item.mainPic??"", height: 120, width: 120),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.title??""),
                            Text(item.subTitle??"",maxLines: 2, overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 13, color: Colors.black54, )),
                            Spacer(),

                            Row(
                              children: [
                                Text("¥${item.price.toString()}",
                                  style: TextStyle(color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold,),),
                                Spacer(),
                                Text("已售${item.sold}件"),
                              ],
                            )
                          ],
                        ),
                      ),

                    ],),
                );
              },
          );

  }

}