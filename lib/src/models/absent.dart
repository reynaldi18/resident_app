import 'package:json_annotation/json_annotation.dart';
import 'package:resident_app/src/models/user.dart';

import 'completeness.dart';

part 'absent.g.dart';

@JsonSerializable()
class Absent {
  @JsonKey(name: 'absensi_id')
  int? absentId;
  @JsonKey(name: 'aktif_flag')
  bool? activeFlag;
  @JsonKey(name: 'check_in')
  String? checkIn;
  @JsonKey(name: 'check_out')
  String? checkOut;
  @JsonKey(name: 'tipe_absensi')
  String? absentType;
  @JsonKey(name: 'desc_absensi')
  String? descAbsent;
  @JsonKey(name: 'tanggal')
  String? date;
  @JsonKey(name: 'created_date')
  String? createdDate;
  @JsonKey(name: 'kelengkapan')
  Completeness? completeness;
  @JsonKey(name: 'user')
  User? user;

  Absent({
    this.absentId,
    this.activeFlag,
    this.checkIn,
    this.checkOut,
    this.absentType,
    this.descAbsent,
    this.date,
    this.createdDate,
    this.completeness,
    this.user,
  });

  factory Absent.fromJson(Map<String, dynamic> json) => _$AbsentFromJson(json);

  Map<String, dynamic> toJson() => _$AbsentToJson(this);
}
