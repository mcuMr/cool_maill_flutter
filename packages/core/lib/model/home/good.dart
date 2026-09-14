import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'good.g.dart';

@JsonSerializable()
class Good {
  final int? id;
  final String? createTime;
  final String? updateTime;
  final int? typeId;
  final String? title;
  final String? subTitle;
  final String? mainPic;
  final List<String>? pics;
  final int? price;
  final int? sold;
  final String? content;
  final List<String>? contentPics;
  final bool? recommend;
  final bool? featured;
  final int? status;
  final int? sortNum;
  final dynamic specs;

  const Good({
    this.id,
    this.createTime,
    this.updateTime,
    this.typeId,
    this.title,
    this.subTitle,
    this.mainPic,
    this.pics,
    this.price,
    this.sold,
    this.content,
    this.contentPics,
    this.recommend,
    this.featured,
    this.status,
    this.sortNum,
    this.specs,
  });

  @override
  String toString() {
    return 'Good(id: $id, createTime: $createTime, updateTime: $updateTime, typeId: $typeId, title: $title, subTitle: $subTitle, mainPic: $mainPic, pics: $pics, price: $price, sold: $sold, content: $content, contentPics: $contentPics, recommend: $recommend, featured: $featured, status: $status, sortNum: $sortNum, specs: $specs)';
  }

  factory Good.fromJson(Map<String, dynamic> json) => _$GoodFromJson(json);

  Map<String, dynamic> toJson() => _$GoodToJson(this);

  Good copyWith({
    int? id,
    String? createTime,
    String? updateTime,
    int? typeId,
    String? title,
    String? subTitle,
    String? mainPic,
    List<String>? pics,
    int? price,
    int? sold,
    String? content,
    List<String>? contentPics,
    bool? recommend,
    bool? featured,
    int? status,
    int? sortNum,
    dynamic specs,
  }) {
    return Good(
      id: id ?? this.id,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      typeId: typeId ?? this.typeId,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      mainPic: mainPic ?? this.mainPic,
      pics: pics ?? this.pics,
      price: price ?? this.price,
      sold: sold ?? this.sold,
      content: content ?? this.content,
      contentPics: contentPics ?? this.contentPics,
      recommend: recommend ?? this.recommend,
      featured: featured ?? this.featured,
      status: status ?? this.status,
      sortNum: sortNum ?? this.sortNum,
      specs: specs ?? this.specs,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Good) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      createTime.hashCode ^
      updateTime.hashCode ^
      typeId.hashCode ^
      title.hashCode ^
      subTitle.hashCode ^
      mainPic.hashCode ^
      pics.hashCode ^
      price.hashCode ^
      sold.hashCode ^
      content.hashCode ^
      contentPics.hashCode ^
      recommend.hashCode ^
      featured.hashCode ^
      status.hashCode ^
      sortNum.hashCode ^
      specs.hashCode;
}
