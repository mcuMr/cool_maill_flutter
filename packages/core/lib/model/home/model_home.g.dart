// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelHome _$ModelHomeFromJson(Map<String, dynamic> json) => ModelHome(
  coupon: (json['coupon'] as List<dynamic>?)
      ?.map((e) => Coupon.fromJson(e as Map<String, dynamic>))
      .toList(),
  banner: (json['banner'] as List<dynamic>?)
      ?.map((e) => Banner.fromJson(e as Map<String, dynamic>))
      .toList(),
  goods: (json['goods'] as List<dynamic>?)
      ?.map((e) => Good.fromJson(e as Map<String, dynamic>))
      .toList(),
  flashSale: (json['flashSale'] as List<dynamic>?)
      ?.map((e) => FlashSale.fromJson(e as Map<String, dynamic>))
      .toList(),
  recommend: (json['recommend'] as List<dynamic>?)
      ?.map((e) => Recommend.fromJson(e as Map<String, dynamic>))
      .toList(),
  categoryAll: (json['categoryAll'] as List<dynamic>?)
      ?.map((e) => CategoryAll.fromJson(e as Map<String, dynamic>))
      .toList(),
  category: (json['category'] as List<dynamic>?)
      ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ModelHomeToJson(ModelHome instance) => <String, dynamic>{
  'coupon': instance.coupon,
  'banner': instance.banner,
  'goods': instance.goods,
  'flashSale': instance.flashSale,
  'recommend': instance.recommend,
  'categoryAll': instance.categoryAll,
  'category': instance.category,
};
