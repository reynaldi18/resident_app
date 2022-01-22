import 'package:json_annotation/json_annotation.dart';

part 'core_res.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class CoreRes<T> {
  bool? success;
  int? count;
  String? message;
  List<T>? data;

  CoreRes({
    this.success,
    this.count,
    this.message,
    this.data,
  });

  factory CoreRes.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CoreResFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$CoreResToJson(this, toJsonT);
}
