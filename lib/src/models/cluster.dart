import 'package:json_annotation/json_annotation.dart';

part 'cluster.g.dart';

@JsonSerializable()
class Cluster {
  @JsonKey(name: 'cluster_id')
  int? clusterId;
  @JsonKey(name: 'cluster_name')
  String? clusterName;
  @JsonKey(name: 'latitude')
  double? latitude;
  @JsonKey(name: 'longitude')
  double? longitude;

  Cluster({
    this.clusterId,
    this.clusterName,
    this.latitude,
    this.longitude,
  });

  factory Cluster.fromJson(Map<String, dynamic> json) =>
      _$ClusterFromJson(json);

  Map<String, dynamic> toJson() => _$ClusterToJson(this);
}
