import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_all.g.dart';

@JsonSerializable()
class CategoryAll {
  final int? id;
  final String? createTime;
  final String? updateTime;
  final String? name;
  final dynamic parentId;
  final int? sortNum;
  final String? pic;
  final int? status;

  const CategoryAll({
    this.id,
    this.createTime,
    this.updateTime,
    this.name,
    this.parentId,
    this.sortNum,
    this.pic,
    this.status,
  });

  @override
  String toString() {
    return 'CategoryAll(id: $id, createTime: $createTime, updateTime: $updateTime, name: $name, parentId: $parentId, sortNum: $sortNum, pic: $pic, status: $status)';
  }

  factory CategoryAll.fromJson(Map<String, dynamic> json) {
    return _$CategoryAllFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryAllToJson(this);

  CategoryAll copyWith({
    int? id,
    String? createTime,
    String? updateTime,
    String? name,
    dynamic parentId,
    int? sortNum,
    String? pic,
    int? status,
  }) {
    return CategoryAll(
      id: id ?? this.id,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      sortNum: sortNum ?? this.sortNum,
      pic: pic ?? this.pic,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CategoryAll) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      createTime.hashCode ^
      updateTime.hashCode ^
      name.hashCode ^
      parentId.hashCode ^
      sortNum.hashCode ^
      pic.hashCode ^
      status.hashCode;
}
