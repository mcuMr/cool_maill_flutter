import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'condition.g.dart';

@JsonSerializable()
class Condition {
  final int? fullAmount;

  const Condition({this.fullAmount});

  @override
  String toString() => 'Condition(fullAmount: $fullAmount)';

  factory Condition.fromJson(Map<String, dynamic> json) {
    return _$ConditionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConditionToJson(this);

  Condition copyWith({int? fullAmount}) {
    return Condition(fullAmount: fullAmount ?? this.fullAmount);
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Condition) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => fullAmount.hashCode;
}
