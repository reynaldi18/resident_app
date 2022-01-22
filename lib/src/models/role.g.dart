// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
      roleId: json['role_id'] as int?,
      roleName: json['role_name'] as String?,
      createDateTime: json['createDateTime'] as String?,
    );

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'role_id': instance.roleId,
      'role_name': instance.roleName,
      'createDateTime': instance.createDateTime,
    };
