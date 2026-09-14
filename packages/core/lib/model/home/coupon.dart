import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'condition.dart';

part 'coupon.g.dart';

@JsonSerializable()
class Coupon {
  final int? id;
  final String? createTime;
  final String? updateTime;
  final String? title;
  final String? description;
  final int? type;
  final int? amount;
  final int? num;
  final int? receivedNum;
  final String? startTime;
  final String? endTime;
  final int? status;
  final Condition? condition;

  const Coupon({
    this.id,
    this.createTime,
    this.updateTime,
    this.title,
    this.description,
    this.type,
    this.amount,
    this.num,
    this.receivedNum,
    this.startTime,
    this.endTime,
    this.status,
    this.condition,
  });

  @override
  String toString() {
    return 'Coupon(id: $id, createTime: $createTime, updateTime: $updateTime, title: $title, description: $description, type: $type, amount: $amount, num: $num, receivedNum: $receivedNum, startTime: $startTime, endTime: $endTime, status: $status, condition: $condition)';
  }

  factory Coupon.fromJson(Map<String, dynamic> json) {
    return _$CouponFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CouponToJson(this);

  Coupon copyWith({
    int? id,
    String? createTime,
    String? updateTime,
    String? title,
    String? description,
    int? type,
    int? amount,
    int? num,
    int? receivedNum,
    String? startTime,
    String? endTime,
    int? status,
    Condition? condition,
  }) {
    return Coupon(
      id: id ?? this.id,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      num: num ?? this.num,
      receivedNum: receivedNum ?? this.receivedNum,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
      condition: condition ?? this.condition,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Coupon) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      createTime.hashCode ^
      updateTime.hashCode ^
      title.hashCode ^
      description.hashCode ^
      type.hashCode ^
      amount.hashCode ^
      num.hashCode ^
      receivedNum.hashCode ^
      startTime.hashCode ^
      endTime.hashCode ^
      status.hashCode ^
      condition.hashCode;
}
