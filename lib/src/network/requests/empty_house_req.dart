import 'package:json_annotation/json_annotation.dart';

part 'empty_house_req.g.dart';

@JsonSerializable()
class EmptyHouseReq {
  @JsonKey(name: 'user_id')
  String? userId;
  @JsonKey(name: 'cluster_id')
  String? clusterId;
  @JsonKey(name: 'from')
  String? from;
  @JsonKey(name: 'until')
  String? until;
  @JsonKey(name: 'keterangan')
  String? note;

  EmptyHouseReq({
    this.userId,
    this.clusterId,
    this.from,
    this.until,
    this.note,
  });

  factory EmptyHouseReq.fromJson(Map<String, dynamic> json) =>
      _$EmptyHouseReqFromJson(json);

  Map<String, dynamic> toJson() => _$EmptyHouseReqToJson(this);
}
