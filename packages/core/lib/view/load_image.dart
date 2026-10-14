import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LoadImage {
  static Widget load( {required String imageUrl, double? width, double? height}) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      placeholder: (context, imageUrl) => const CircularProgressIndicator(),
      errorWidget: (context, imageUrl, error) => const Icon(Icons.error),
    );
  }

    static Widget loadBorderRadius( {required String imageUrl, double? width, double? height, double borderRadius = 16.0}) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: width,
            height: height,
            placeholder: (context, imageUrl) => const CircularProgressIndicator(),
            errorWidget: (context, imageUrl, error) => const Icon(Icons.error),
        ),
    );

  }
}