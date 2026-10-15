import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../model/home/coupon.dart';

class ViewNoticeMarquee extends StatelessWidget {
  final List<Coupon>  notices ;

  const ViewNoticeMarquee({super.key, required this.notices});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 36,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white70,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        padding: const EdgeInsets.only(left: 8),
      child: Row(
        children: [

          const Icon(
            Icons.volume_up_outlined,
            size: 20,
            color: Colors.orange,
          ),

          const SizedBox(width: 8),

          Expanded(
            child: CarouselSlider.builder(
              itemCount: notices.length,
              itemBuilder: (context, index, realIndex) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    notices[index].title??"",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 36,
                scrollDirection: Axis.vertical,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration:
                const Duration(milliseconds: 500),
                autoPlayCurve: Curves.easeInOut,
                enableInfiniteScroll: true,
                viewportFraction: 1.0,
                pauseAutoPlayOnTouch: true,
              ),
            ),
          ),
        ],
      )
    );
  }
}