
import 'package:core/model/home/good.dart';
import 'package:flutter/material.dart';
import 'package:core/view/load_image.dart';
import 'package:core/view/staggered_grid_view.dart';

class ViewAllShop extends StatelessWidget {
  final List<Good> shopAll;
  final ValueChanged<Good>? onItemTap;

  const ViewAllShop({super.key, required this.shopAll, this.onItemTap,});

  @override
  Widget build(BuildContext context) {
    return MyStaggeredGridView.load(
        itemCount: shopAll.length,
        crossAxisCount: 2,
        itemBuilder: (context, index) {
          var item = shopAll[index];
          return InkWell(
                onTap: () => onItemTap?.call(item),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: LoadImage.loadBorderRadius(
                          imageUrl: item.mainPic ?? "",
                          borderRadius: 4,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(item.title ?? ""),
                      const SizedBox(height: 4),
                      Text(
                        item.subTitle ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            "¥${item.price ?? '--'}",
                            style: const TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text("已售${item.sold ?? 0}件"),
                        ],
                      ),
                    ],
                  ),
                )
              );
       }
     );
    
  }
}