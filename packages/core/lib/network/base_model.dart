import 'package:json_annotation/json_annotation.dart';
part 'base_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseModel<T> {
  final int code;
  final String message;
  final T? data;

  const BaseModel({
    required this.code,
    required this.message,
    this.data,
  });

  factory BaseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$BaseModelFromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJson(
    Object? Function(T value) toJsonT,
  ) {
    return _$BaseModelToJson(this, toJsonT);
  }
}