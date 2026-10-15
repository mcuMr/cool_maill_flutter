import 'package:core/view/load_image.dart';
import 'package:flutter/material.dart';

import '../model/home/category.dart';

class ViewCategory extends StatelessWidget{
  final List<Category> categoryAll;
  final ValueChanged<Category>? onItemTap;

  const ViewCategory({super.key, required this.categoryAll, this.onItemTap,});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white70,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        padding: const EdgeInsets.only(left: 8),
        child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),// 禁止滚动
            itemCount: categoryAll.length, // 限制生成数量
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {

              var item = categoryAll[index];

              return InkWell(
                onTap: () => onItemTap?.call(item),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadImage.load(imageUrl: item.pic??"",width: 48,height: 48),
                    Text(item.name??"",),
                  ],
                ),
              );
            }
        )
    );
  }

}