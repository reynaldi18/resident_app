// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_res_single.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoreResSingle<T> _$CoreResSingleFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    CoreResSingle<T>(
      success: json['success'] as bool?,
      count: json['count'] as int?,
      message: json['message'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$CoreResSingleToJson<T>(
  CoreResSingle<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'message': instance.message,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
