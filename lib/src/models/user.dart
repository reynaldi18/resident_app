import 'package:json_annotation/json_annotation.dart';

import 'absent.dart';
import 'client.dart';
import 'cluster.dart';
import 'role.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'birth_plc')
  String? birthPlc;
  @JsonKey(name: 'birth_dt')
  String? birthDt;
  @JsonKey(name: 'nik')
  String? nik;
  @JsonKey(name: 'agama')
  String? religion;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'alamat')
  String? address;
  @JsonKey(name: 'no_rekening')
  String? noAccount;
  @JsonKey(name: 'image_link')
  String? imageLink;
  @JsonKey(name: 'kota')
  String? city;
  @JsonKey(name: 'provinsi')
  String? province;
  @JsonKey(name: 'kode_pos')
  String? postalCode;
  @JsonKey(name: 'join_dt')
  String? joinDt;
  @JsonKey(name: 'resign_dt')
  String? resignDt;
  @JsonKey(name: 'role')
  Role? role;
  @JsonKey(name: 'client')
  Client? client;
  @JsonKey(name: 'cluster')
  Cluster? cluster;
  @JsonKey(name: 'absensis')
  List<Absent>? absent;

  User({
    this.userId,
    this.email,
    this.name,
    this.gender,
    this.birthPlc,
    this.birthDt,
    this.nik,
    this.religion,
    this.phone,
    this.address,
    this.noAccount,
    this.imageLink,
    this.city,
    this.province,
    this.postalCode,
    this.joinDt,
    this.resignDt,
    this.role,
    this.absent,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
