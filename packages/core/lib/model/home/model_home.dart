import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'banner.dart';
import 'category.dart';
import 'category_all.dart';
import 'coupon.dart';
import 'flash_sale.dart';
import 'good.dart';
import 'recommend.dart';

part 'model_home.g.dart';

@JsonSerializable()
class ModelHome {
  final List<Coupon>? coupon;
  final List<Banner>? banner;
  final List<Good>? goods;
  final List<FlashSale>? flashSale;
  final List<Recommend>? recommend;
  final List<CategoryAll>? categoryAll;
  final List<Category>? category;

  const ModelHome({
    this.coupon,
    this.banner,
    this.goods,
    this.flashSale,
    this.recommend,
    this.categoryAll,
    this.category,
  });

  @override
  String toString() {
    return 'ModelHome(coupon: $coupon, banner: $banner, goods: $goods, flashSale: $flashSale, recommend: $recommend, categoryAll: $categoryAll, category: $category)';
  }

  factory ModelHome.fromJson(Map<String, dynamic> json) => _$ModelHomeFromJson(json);

  Map<String, dynamic> toJson() => _$ModelHomeToJson(this);

  ModelHome copyWith({
    List<Coupon>? coupon,
    List<Banner>? banner,
    List<Good>? goods,
    List<FlashSale>? flashSale,
    List<Recommend>? recommend,
    List<CategoryAll>? categoryAll,
    List<Category>? category,
  }) {
    return ModelHome(
      coupon: coupon ?? this.coupon,
      banner: banner ?? this.banner,
      goods: goods ?? this.goods,
      flashSale: flashSale ?? this.flashSale,
      recommend: recommend ?? this.recommend,
      categoryAll: categoryAll ?? this.categoryAll,
      category: category ?? this.category,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ModelHome) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      coupon.hashCode ^
      banner.hashCode ^
      goods.hashCode ^
      flashSale.hashCode ^
      recommend.hashCode ^
      categoryAll.hashCode ^
      category.hashCode;
}
