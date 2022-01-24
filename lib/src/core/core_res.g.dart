// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoreRes<T> _$CoreResFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    CoreRes<T>(
      success: json['success'] as bool?,
      count: json['count'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$CoreResToJson<T>(
  CoreRes<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'message': instance.message,
      'data': instance.data?.map(toJsonT).toList(),
    };
