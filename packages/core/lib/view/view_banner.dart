import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:core/view/load_image.dart';
import 'package:flutter/widgets.dart';
import 'package:core/model/home/banner.dart' as BannerModel;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ViewBanner extends StatefulWidget {

    final List<BannerModel.Banner> banners;
    final ValueChanged<int>? onImageTap;

    const ViewBanner({
        super.key,
        required this.banners,
        this.onImageTap,
    });

  @override
  State<StatefulWidget> createState() {
    return ViewBannerState(banners: banners, onImageTap: onImageTap);
  }
}

class ViewBannerState extends State<ViewBanner> {
  ViewBannerState({ValueChanged<int>? onImageTap, required List<BannerModel.Banner> banners});

   final sliderController = CarouselSliderController();
   int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
            CarouselSlider(
                carouselController: sliderController,
                items: getImageWidgets(widget.banners, onImageTap: widget.onImageTap),
                options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 500),
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    enableInfiniteScroll: true,
                    onPageChanged: (index, reason) {
                        setState(() {
                            activeIndex = index;
                        });
                    },
                ),
            ),
            SizedBox(height: 8,),
            // 指示器
            AnimatedSmoothIndicator(
                activeIndex: activeIndex,     
                count:  widget.banners.length,
                effect:  WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 4
                ),  // your preferred effect
                onDotClicked: (index){
                    setState(() {
                        activeIndex = index;
                    });
                    sliderController.animateToPage(index);
                }
            ), 
         
        ],
    );
  }

  List<Widget>? getImageWidgets(List<BannerModel.Banner> imageUrls, { ValueChanged<int>? onImageTap }) {
    return imageUrls.mapIndexed((index, item) => GestureDetector(
      onTap: () => onImageTap?.call(index),
      child: LoadImage.loadBorderRadius(imageUrl: item.pic ?? "", width: double.infinity, height: 200),
    )).toList();
  }
}