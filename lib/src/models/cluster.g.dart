// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cluster.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cluster _$ClusterFromJson(Map<String, dynamic> json) => Cluster(
      clusterId: json['cluster_id'] as int?,
      clusterName: json['cluster_name'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ClusterToJson(Cluster instance) => <String, dynamic>{
      'cluster_id': instance.clusterId,
      'cluster_name': instance.clusterName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
