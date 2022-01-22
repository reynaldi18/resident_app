import 'package:json_annotation/json_annotation.dart';
import 'package:resident_app/src/models/cluster.dart';

part 'client.g.dart';

@JsonSerializable()
class Client {
  @JsonKey(name: 'client_id')
  int? clientId;
  @JsonKey(name: 'client_name')
  String? clientName;
  @JsonKey(name: 'client_email')
  String? clientEmail;
  @JsonKey(name: 'client_phone')
  String? clientPhone;
  @JsonKey(name: 'nomor_rekening')
  String? noAccount;
  @JsonKey(name: 'alamat')
  String? address;
  @JsonKey(name: 'kota')
  String? city;
  @JsonKey(name: 'provinsi')
  String? province;
  @JsonKey(name: 'kode_pos')
  String? postalCode;
  @JsonKey(name: 'image_link')
  String? imageLink;
  @JsonKey(name: 'doc_penunjang')
  String? docSupport;
  @JsonKey(name: 'clusters')
  List<Cluster>? clusters;

  Client({
    this.clientId,
    this.clientName,
    this.clientEmail,
    this.clientPhone,
    this.noAccount,
    this.address,
    this.city,
    this.province,
    this.postalCode,
    this.imageLink,
    this.docSupport,
    this.clusters,
  });

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}
