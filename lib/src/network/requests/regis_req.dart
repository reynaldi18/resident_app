import 'package:json_annotation/json_annotation.dart';

part 'regis_req.g.dart';

@JsonSerializable()
class RegisReq {
  @JsonKey(name: 'client_id')
  String? clientId;
  @JsonKey(name: 'cluster_id')
  String? clusterId;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'alamat')
  String? address;
  @JsonKey(name: 'password')
  String? password;

  RegisReq({
    this.clientId,
    this.clusterId,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.password,
  });

  factory RegisReq.fromJson(Map<String, dynamic> json) =>
      _$RegisReqFromJson(json);

  Map<String, dynamic> toJson() => _$RegisReqToJson(this);
}
