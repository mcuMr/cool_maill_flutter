// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_all.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryAll _$CategoryAllFromJson(Map<String, dynamic> json) => CategoryAll(
  id: (json['id'] as num?)?.toInt(),
  createTime: json['createTime'] as String?,
  updateTime: json['updateTime'] as String?,
  name: json['name'] as String?,
  parentId: json['parentId'],
  sortNum: (json['sortNum'] as num?)?.toInt(),
  pic: json['pic'] as String?,
  status: (json['status'] as num?)?.toInt(),
);

Map<String, dynamic> _$CategoryAllToJson(CategoryAll instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'name': instance.name,
      'parentId': instance.parentId,
      'sortNum': instance.sortNum,
      'pic': instance.pic,
      'status': instance.status,
    };
