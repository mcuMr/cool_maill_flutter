// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) => Banner(
  id: (json['id'] as num?)?.toInt(),
  createTime: json['createTime'] as String?,
  updateTime: json['updateTime'] as String?,
  description: json['description'] as String?,
  path: json['path'] as String?,
  pic: json['pic'] as String?,
  sortNum: (json['sortNum'] as num?)?.toInt(),
  status: (json['status'] as num?)?.toInt(),
);

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
  'id': instance.id,
  'createTime': instance.createTime,
  'updateTime': instance.updateTime,
  'description': instance.description,
  'path': instance.path,
  'pic': instance.pic,
  'sortNum': instance.sortNum,
  'status': instance.status,
};
