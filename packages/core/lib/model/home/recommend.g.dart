// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recommend _$RecommendFromJson(Map<String, dynamic> json) => Recommend(
  id: (json['id'] as num?)?.toInt(),
  createTime: json['createTime'] as String?,
  updateTime: json['updateTime'] as String?,
  typeId: (json['typeId'] as num?)?.toInt(),
  title: json['title'] as String?,
  subTitle: json['subTitle'] as String?,
  mainPic: json['mainPic'] as String?,
  pics: (json['pics'] as List<dynamic>?)?.map((e) => e as String).toList(),
  price: (json['price'] as num?)?.toInt(),
  sold: (json['sold'] as num?)?.toInt(),
  content: json['content'] as String?,
  contentPics: (json['contentPics'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  recommend: json['recommend'] as bool?,
  featured: json['featured'] as bool?,
  status: (json['status'] as num?)?.toInt(),
  sortNum: (json['sortNum'] as num?)?.toInt(),
  specs: json['specs'],
);

Map<String, dynamic> _$RecommendToJson(Recommend instance) => <String, dynamic>{
  'id': instance.id,
  'createTime': instance.createTime,
  'updateTime': instance.updateTime,
  'typeId': instance.typeId,
  'title': instance.title,
  'subTitle': instance.subTitle,
  'mainPic': instance.mainPic,
  'pics': instance.pics,
  'price': instance.price,
  'sold': instance.sold,
  'content': instance.content,
  'contentPics': instance.contentPics,
  'recommend': instance.recommend,
  'featured': instance.featured,
  'status': instance.status,
  'sortNum': instance.sortNum,
  'specs': instance.specs,
};
