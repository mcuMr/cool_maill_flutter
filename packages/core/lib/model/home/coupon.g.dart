// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coupon _$CouponFromJson(Map<String, dynamic> json) => Coupon(
  id: (json['id'] as num?)?.toInt(),
  createTime: json['createTime'] as String?,
  updateTime: json['updateTime'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  type: (json['type'] as num?)?.toInt(),
  amount: (json['amount'] as num?)?.toInt(),
  num: (json['num'] as num?)?.toInt(),
  receivedNum: (json['receivedNum'] as num?)?.toInt(),
  startTime: json['startTime'] as String?,
  endTime: json['endTime'] as String?,
  status: (json['status'] as num?)?.toInt(),
  condition: json['condition'] == null
      ? null
      : Condition.fromJson(json['condition'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CouponToJson(Coupon instance) => <String, dynamic>{
  'id': instance.id,
  'createTime': instance.createTime,
  'updateTime': instance.updateTime,
  'title': instance.title,
  'description': instance.description,
  'type': instance.type,
  'amount': instance.amount,
  'num': instance.num,
  'receivedNum': instance.receivedNum,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'status': instance.status,
  'condition': instance.condition,
};
