import 'package:json_annotation/json_annotation.dart';

part 'core_res_single.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class CoreResSingle<T> {
  bool? success;
  int? count;
  String? message;
  T? data;

  CoreResSingle({
    this.success,
    this.count,
    this.message,
    this.data,
  });

  factory CoreResSingle.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CoreResSingleFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$CoreResSingleToJson(this, toJsonT);
}
