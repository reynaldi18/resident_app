// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty_house_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmptyHouseReq _$EmptyHouseReqFromJson(Map<String, dynamic> json) =>
    EmptyHouseReq(
      userId: json['user_id'] as String?,
      clusterId: json['cluster_id'] as String?,
      from: json['from'] as String?,
      until: json['until'] as String?,
      note: json['keterangan'] as String?,
    );

Map<String, dynamic> _$EmptyHouseReqToJson(EmptyHouseReq instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'cluster_id': instance.clusterId,
      'from': instance.from,
      'until': instance.until,
      'keterangan': instance.note,
    };
