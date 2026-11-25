import 'package:flutter/material.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class MyStaggeredGridView {

  static Widget load ({
    required int itemCount,
    required int crossAxisCount,
    required NullableIndexedWidgetBuilder itemBuilder,
    EdgeInsetsGeometry? padding,
    double mainAxisSpacing = 16.0,
    double crossAxisSpacing = 16.0,
    bool shrinkWrap = true,
  }){

    return WaterfallFlow.builder(
      itemCount: itemCount,
      shrinkWrap: shrinkWrap,
      physics: const NeverScrollableScrollPhysics(),
      padding: padding ?? EdgeInsets.zero,
      gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
      ),
      itemBuilder: itemBuilder,
    );
  }
}