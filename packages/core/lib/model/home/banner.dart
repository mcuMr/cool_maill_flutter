import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class Banner {
  final int? id;
  final String? createTime;
  final String? updateTime;
  final String? description;
  final String? path;
  final String? pic;
  final int? sortNum;
  final int? status;

  const Banner({
    this.id,
    this.createTime,
    this.updateTime,
    this.description,
    this.path,
    this.pic,
    this.sortNum,
    this.status,
  });

  @override
  String toString() {
    return 'Banner(id: $id, createTime: $createTime, updateTime: $updateTime, description: $description, path: $path, pic: $pic, sortNum: $sortNum, status: $status)';
  }

  factory Banner.fromJson(Map<String, dynamic> json) {
    return _$BannerFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BannerToJson(this);

  Banner copyWith({
    int? id,
    String? createTime,
    String? updateTime,
    String? description,
    String? path,
    String? pic,
    int? sortNum,
    int? status,
  }) {
    return Banner(
      id: id ?? this.id,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      description: description ?? this.description,
      path: path ?? this.path,
      pic: pic ?? this.pic,
      sortNum: sortNum ?? this.sortNum,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Banner) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      createTime.hashCode ^
      updateTime.hashCode ^
      description.hashCode ^
      path.hashCode ^
      pic.hashCode ^
      sortNum.hashCode ^
      status.hashCode;
}
