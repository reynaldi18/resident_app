// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth _$AuthFromJson(Map<String, dynamic> json) => Auth(
      statusCode: json['statusCode'] as int?,
      data: json['data'] == null
          ? null
          : User.fromJson(json['data'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'data': instance.data,
      'access_token': instance.accessToken,
      'message': instance.message,
    };
