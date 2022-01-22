// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regis_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisReq _$RegisReqFromJson(Map<String, dynamic> json) => RegisReq(
      clientId: json['client_id'] as String?,
      clusterId: json['cluster_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['alamat'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$RegisReqToJson(RegisReq instance) => <String, dynamic>{
      'client_id': instance.clientId,
      'cluster_id': instance.clusterId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'alamat': instance.address,
      'password': instance.password,
    };
